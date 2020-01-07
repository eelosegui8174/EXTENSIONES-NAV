codeunit 50101 "Cosmo Control de calidad"
{
    //FUNCIONES PRINCIPALES

    procedure Gestion_Claidad_Plazo_Envio(T37_anterior: Record "Sales Line"; T37: Record "Sales Line")
    var
        tCalidad: record "Cosmo Log Calidad plazos envio";
        campo: Option ,"Fecha requerida",Cliente,Producto,Cantidad;
    begin
        IF (T37."Document Type" = T37."Document Type"::Order) AND (T37.Type = T37.Type::Item) THEN BEGIN

            CLEAR(tCalidad);
            tCalidad.SETRANGE(tCalidad."No. pedido", T37."Document No.");
            tCalidad.SETRANGE(tCalidad."Linea pedido", T37."Line No.");

            //1º CUANDO ASIGNAMOS UNA FECHA ENTREGA REQUERIDA NUEVA
            IF ((T37_anterior."Requested Delivery Date" = 0D) AND (T37."Requested Delivery Date" <> 0D))
               OR (tCalidad.ISEMPTY()) THEN
                Genera_Lineas_Plazo_Envio(T37);


            //2º CUANDO MODIFICAMOS LA FECHA ENTREGA REQUERIDA
            IF T37_anterior."Requested Delivery Date" <> T37."Requested Delivery Date" THEN BEGIN

                IF T37."Requested Delivery Date" = 0D THEN
                    Borrar_Lineas_Plazo_Envio(T37);

                IF T37."Requested Delivery Date" <> 0D THEN
                    Modifica_Lineas_Plazo_Envio(T37, Campo::"Fecha requerida");

            END;

            IF T37_anterior.Quantity <> T37.Quantity THEN
                Modifica_Lineas_Plazo_Envio(T37, Campo::Cantidad);

            IF T37_anterior."No." <> T37."No." THEN
                Modifica_Lineas_Plazo_Envio(T37, Campo::Producto);

        END;
    end;


    procedure Genera_Lineas_Plazo_Envio(T37: Record "Sales Line")
    var
        tCalidad: record "Cosmo Log Calidad plazos envio";
        tCliente: record Customer;
        T36: Record "Sales Header";
        tConfCalidad: record "Cosmo Conf. compromiso entrega";
    begin
        CLEAR(tCliente);
        tCliente.GET(T37."Sell-to Customer No.");

        CLEAR(t36);
        t36.GET(T37."Document Type", T37."Document No.");

        //solo creamos si tiene configurado compromiso de entrega
        CLEAR(tConfCalidad);
        tConfCalidad.SETRANGE(tConfCalidad.Cliente, T37."Sell-to Customer No.");
        IF NOT tConfCalidad.ISEMPTY() THEN BEGIN
            IF T37."Line No." <> 0 THEN BEGIN
                CLEAR(tCalidad);
                tCalidad.INIT();
                tCalidad.VALIDATE("No. pedido", T37."Document No.");
                tCalidad.VALIDATE("Linea pedido", T37."Line No.");
                tCalidad.VALIDATE("Fecha pedido", t36."Order Date");
                tCalidad.VALIDATE("No. cliente", T37."Sell-to Customer No.");
                tCalidad.VALIDATE("Nombre cliente", tCliente.Name);
                tCalidad.VALIDATE("No. producto", T37."No.");
                tCalidad.VALIDATE(Descripcion, T37.Description);
                tCalidad.VALIDATE("Cantidad linea", T37.Quantity);
                tCalidad.VALIDATE("Fecha entrega requerida", T37."Requested Delivery Date");
                tCalidad.VALIDATE("Dia solicitud requerida", T37."cosmo Dia solicitud requerida");
                tCalidad.VALIDATE("Fecha comprometida", T37."cosmo Fecha comprometida");
                tCalidad.VALIDATE("Dia comprometido", T37."cosmo Dia comprometido");
                tCalidad.VALIDATE("Solicitado en tiempo", T37."cosmo Solicitado en tiempo");
                tCalidad.INSERT(TRUE);
            END;

            Actualizar_Campos_Globales(T37."Document No.");
        END;

    END;

    procedure Modifica_Lineas_Plazo_Envio(T37: Record "Sales Line"; Campo: Option ,"Fecha requerida",Cliente,Producto,Cantidad)
    var
        tCalidad: record "Cosmo Log Calidad plazos envio";
        tCliente: record Customer;
    begin

        CLEAR(tCalidad);
        tCalidad.SETRANGE(tCalidad."No. pedido", T37."Document No.");
        tCalidad.SETRANGE(tCalidad."Linea pedido", T37."Line No.");
        //IF Campo <> Campo::Cantidad THEN 
        //  tCalidad.SETRANGE(tCalidad."Cantidad enviada",0);
        IF tCalidad.FINDSET() THEN BEGIN
            REPEAT

                IF Campo = Campo::"Fecha requerida" THEN BEGIN
                    tCalidad.VALIDATE("Fecha entrega requerida", T37."Requested Delivery Date");
                    tCalidad.VALIDATE("Fecha entrega requerida", T37."Requested Delivery Date");
                    tCalidad.VALIDATE("Dia solicitud requerida", T37."cosmo Dia solicitud requerida");
                    tCalidad.VALIDATE("Fecha comprometida", T37."cosmo Fecha comprometida");
                    tCalidad.VALIDATE("Dia comprometido", T37."cosmo Dia comprometido");
                    tCalidad.VALIDATE("Solicitado en tiempo", T37."cosmo Solicitado en tiempo");
                END;


                IF Campo = Campo::Cliente THEN BEGIN
                    CLEAR(tCliente);
                    tCliente.GET(T37."Sell-to Customer No.");
                    tCalidad.VALIDATE(tCalidad."No. cliente", T37."Sell-to Customer No.");
                    tCalidad.VALIDATE("Nombre cliente", tCliente.Name);
                END;

                IF Campo = Campo::Producto THEN BEGIN
                    tCalidad.VALIDATE("No. producto", T37."No.");
                    tCalidad.VALIDATE(Descripcion, T37.Description);
                END;

                IF Campo = Campo::Cantidad THEN BEGIN
                    tCalidad.VALIDATE(tCalidad."Cantidad linea", T37.Quantity);
                END;

                tCalidad.MODIFY(TRUE);

            UNTIL tCalidad.NEXT() = 0;
        END ELSE
            //Puede ser que las que haya sean de otra fecha requerida ya enviada asi que creamos una nueva para esta fecha
            //no deberia darse el caso.
            Genera_Lineas_Plazo_Envio(T37);


        Actualizar_Campos_Globales(T37."Document No.");
    end;


    procedure Modifica_Lineas_Plazo_Envio_desde_T110(t110: Record "Sales Shipment Header"; t111: Record "Sales Shipment Line")
    var
        T37: record "Sales Line";
        tCalidad: record "Cosmo Log Calidad plazos envio";
        Encuentra: Boolean;

    begin
        //[07]:VJER-0027<<
        //se llamara desde la codeunit 80 cuando genera el albaran

        Encuentra := FALSE;

        CLEAR(tCalidad);
        tCalidad.SETRANGE(tCalidad."No. pedido", t111."Order No.");
        tCalidad.SETRANGE(tCalidad."Linea pedido", t111."Order Line No.");

        //1º miramos si para esa fecha y fecha recepcion requeria hay algo para ampliar cantidad
        tCalidad.SETRANGE(tCalidad."Fecha envio", t110."Posting Date");
        IF tCalidad.FINDFIRST() THEN BEGIN
            //la asignacion la hace abajo
            Encuentra := TRUE;
        END;

        //2º si no hay miramos si hay con fecha envio vacio 
        IF Encuentra = FALSE THEN BEGIN
            tCalidad.SETRANGE(tCalidad."Fecha envio", 0D);
            IF tCalidad.FINDFIRST() THEN BEGIN
                tCalidad.RENAME(tCalidad."No. pedido", tCalidad."Linea pedido", t110."Posting Date");
                Encuentra := TRUE;
            END;
        END;


        //3º y si no hay generamos una  para esa fecha envio y esa fecha encio requerida
        IF Encuentra = FALSE THEN BEGIN
            CLEAR(t37);
            IF t37.GET(t37."Document Type"::Order, t111."Order No.", t111."Order Line No.") THEN BEGIN
                //lo creamos 
                Genera_Lineas_Plazo_Envio(t37);

                //Busco el que acabo de crear para modificarlo
                CLEAR(tCalidad);
                tCalidad.SETRANGE(tCalidad."No. pedido", t111."Order No.");
                tCalidad.SETRANGE(tCalidad."Linea pedido", t111."Order Line No.");
                tCalidad.SETRANGE(tCalidad."Fecha envio", 0D);
                IF tCalidad.FINDFIRST() THEN BEGIN
                    tCalidad.RENAME(tCalidad."No. pedido", tCalidad."Linea pedido", t110."Posting Date");

                    Encuentra := TRUE;
                END;
            END;
        END;



        //si enviamos tarde marcamos como tarde
        IF Encuentra THEN BEGIN

            IF tCalidad.GET(t111."Order No.", t111."Order Line No.", t110."Posting Date") THEN BEGIN


                tCalidad.VALIDATE("Cantidad enviada", tCalidad."Cantidad enviada" + t111.Quantity);
                tCalidad.VALIDATE(tCalidad."Fecha entrega requerida", t111."Requested Delivery Date");

                //si lo han solicitado en tiempo pero lo hemos entregado fuera mas tarde de lo requerido
                tCalidad."Enviado en tiempo" := tCalidad."Enviado en tiempo"::"En tiempo";

                tCalidad.MODIFY(TRUE);

                Actualizar_Campos_Globales(t111."Order No.");
            END;

        END;
    end;

    procedure Borrar_Lineas_Plazo_Envio(T37: Record "Sales Line")
    var
        tCalidad: record "Cosmo Log Calidad plazos envio";
    begin

        CLEAR(tCalidad);
        tCalidad.SETRANGE(tCalidad."No. pedido", T37."Document No.");
        tCalidad.SETRANGE(tCalidad."Linea pedido", T37."Line No.");
        tCalidad.SETRANGE(tCalidad."Cantidad enviada", 0);
        IF tCalidad.FINDFIRST() THEN
            tCalidad.DELETEALL();

        Actualizar_Campos_Globales(T37."Document No.");
    end;

    LOCAL procedure Actualizar_Campos_Globales(NumPedido: Code[20])
    var
        tCalidad: record "Cosmo Log Calidad plazos envio";
        t36: Record 36;
    begin
        CLEAR(t36);
        IF t36.GET(t36."Document Type"::Order, NumPedido) THEN
            t36.CALCFIELDS(t36."Cosmo Cant en lineas venta", t36."cosmo Total solicitado OT", t36."cosmo Total solicitado T");


        CLEAR(tCalidad);
        tCalidad.SETRANGE(tCalidad."No. pedido", NumPedido);
        IF tCalidad.FINDSET() THEN
            REPEAT

                tCalidad.CALCFIELDS(tCalidad."Total enviado pedido", tCalidad."Total enviado pedido OT", tCalidad."Total enviado pedido L", tCalidad."Total enviado  linea");

                tCalidad."Cantidad pendiente" := tCalidad."Cantidad linea" - tCalidad."Total enviado  linea";
                tCalidad."Total cantidad pendiente" := tCalidad."Total cantidad pedido" - tCalidad."Total enviado pedido";

                tCalidad."Fecha pedido" := t36."Order Date";

                IF (tCalidad."Fecha envio" <= tCalidad."Fecha comprometida") THEN
                    tCalidad."Enviado en tiempo" := tCalidad."Enviado en tiempo"::"En tiempo"
                ELSE
                    tCalidad."Enviado en tiempo" := tCalidad."Enviado en tiempo"::Tarde;

                //esta cantidad va ser la misma para todas las lineas  de la misma linea de pedido ya que es comun para todas
                tCalidad."Cant. solicitado OT" := 0;
                tCalidad."Cant. solicitado T" := 0;
                IF (tCalidad."Solicitado en tiempo" = tCalidad."Solicitado en tiempo"::"En tiempo") THEN
                    tCalidad."Cant. solicitado OT" := tCalidad."Cantidad linea"
                ELSE
                    tCalidad."Cant. solicitado T" := tCalidad."Cantidad linea";

                IF tCalidad."Cantidad enviada" <> 0 THEN
                    tCalidad."Porc. cantidad en tiempo linea" := tCalidad."Enviado en tiempo" * 100 / tCalidad."Cantidad enviada";

                //TOTALES

                tCalidad."Total cantidad pedido" := t36."cosmo Cant en lineas venta";
                tCalidad."Total solicitado OT" := t36."cosmo Total solicitado OT";
                tCalidad."Total solicitado T" := t36."cosmo Total solicitado T";
                tCalidad."Porcentaje enviado pedido" := 0;

                IF tCalidad."Total cantidad pedido" <> 0 THEN
                    tCalidad."Porcentaje enviado pedido" := tCalidad."Total enviado pedido" * 100 / tCalidad."Total cantidad pedido";

                tCalidad."Porc. cantidad en tiempo ped." := 0;
                IF tCalidad."Total enviado pedido" <> 0 THEN
                    tCalidad."Porc. cantidad en tiempo ped." := ROUND(tCalidad."Total enviado pedido OT" * 100 / tCalidad."Total enviado pedido", 1);


                tCalidad.MODIFY(TRUE);

            UNTIL tCalidad.NEXT() = 0;
    end;

    procedure AbreConfAprobaciones(Rec: Record Customer)
    var
        tconfcompromiso: Record "Cosmo Conf. compromiso entrega";
        pconfcompromiso: Page "Cosmo Conf. compromiso entrega";
    begin
        Clear(tconfcompromiso);
        tconfcompromiso.FilterGroup(2);
        tconfcompromiso.SetRange(Cliente, rec."No.");
        tconfcompromiso.FilterGroup(0);

        Clear(pconfcompromiso);
        pconfcompromiso.SetTableView(tconfcompromiso);
        pconfcompromiso.Run();
    end;

    procedure AbreLogCalidadEnvios(Rec: Record Customer; NumPedido: code[20])
    var
        tLogCalidadEnvios: Record "Cosmo Log Calidad plazos envio";
        pLogCalidadEnvios: page "Cosmo Log. cal. plazo envios";
    begin
        Clear(tLogCalidadEnvios);
        tLogCalidadEnvios.FilterGroup(2);
        tLogCalidadEnvios.SetRange("No. cliente", rec."No.");
        if NumPedido <> '' then
            tLogCalidadEnvios.SetRange("No. pedido", NumPedido);
        tLogCalidadEnvios.FilterGroup(0);

        Clear(pLogCalidadEnvios);
        pLogCalidadEnvios.SetTableView(tLogCalidadEnvios);
        pLogCalidadEnvios.Run();
    end;

    procedure Abre_Conf_Plazos_Cliente_Desde_Pedido_Venta(Rec: Record "Sales Header")
    var
        eCliente: record Customer;
    begin
        if eCliente.get(Rec."Sell-to Customer No.") then
            AbreConfAprobaciones(eCliente);
    end;

    procedure Abre_Log_Plazos_Cliente_Desde_Pedido_Venta(Rec: Record "Sales Header")
    var
        eCliente: record Customer;
    begin
        if eCliente.get(Rec."Sell-to Customer No.") then
            AbreLogCalidadEnvios(eCliente, Rec."No.");
    end;

    procedure Control_Fecha_Requerida_En_Tiempo(var T37: Record "sales line"; CodCliente: Code[20]; FechaPedido: Date; HoraPedido: Time; FechaRequerida: Date; EsTest: Boolean)
    var
        SalesHeader: record "Sales Header";
        tDatePide: record Date;
        tDateHoy: record Date;
        tDateComprometemos: record Date;
        tCompromiso: Record "Cosmo Conf. compromiso entrega";
        tCompromisoEncontrado: Record "Cosmo Conf. compromiso entrega";
        Encontrado: Boolean;
        DiaPide: Text[50];
        DiaActual: Text[50];
        Error50000: Label 'Error en configuración de tabla de compromiso para cliente %1 y día/hora %2 %3.';
    begin
        //SI NO ES TEST TENEMOS QUE REUCPERAR LA FECHA DESDE EL PEDIDO Y LINEA
        //--------------------------------------------------------------------
        IF EsTest = FALSE THEN BEGIN
            IF (T37."Document Type" <> T37."Document Type"::Order) OR (T37.Type = T37.Type::" ") THEN
                EXIT;
            CLEAR(SalesHeader);
            SalesHeader.GET(T37."Document Type", T37."Document No.");
            FechaPedido := SalesHeader."Order Date";
            HoraPedido := TIME();
            FechaRequerida := T37."Requested Delivery Date";
        END;


        IF FechaRequerida = 0D THEN
            EXIT;



        //1º buscamos el dia que pide
        CLEAR(tDatePide);
        tDatePide.SETRANGE("Period Type", 0);  //dia
        tDatePide.SETRANGE("Period Start", FechaRequerida);
        IF tDatePide.FINDFIRST() THEN
            DiaPide := tDatePide."Period Name";

        //2º Sacamos el dia que estamos
        CLEAR(tDateHoy);
        tDateHoy.SETRANGE("Period Type", 0);  //dia
        tDateHoy.SETRANGE("Period Start", FechaPedido);   //cambiaremos por la fecha del pedido
        IF tDateHoy.FINDFIRST() THEN
            DiaActual := tDateHoy."Period Name";


        T37."Cosmo Dia solicitud requerida" := DiaPide;

        //3º Con la fecha de del pedido tengo que buscar en la tabla que registro le corresponde
        //-- Filtramos el desde dia con el period  no. ya que es el numero del periodo y coincide con las opciones del option
        CLEAR(tCompromiso);
        tCompromiso.SETRANGE(tCompromiso.Cliente, CodCliente);
        IF tCompromiso.FINDFIRST() THEN BEGIN


            //  tCompromiso.SETFILTER(tCompromiso."Desde dia",'<=%1',tDateHoy."Period No.");
            //  tCompromiso.SETFILTER(tCompromiso."Hasta dia",'>=%1',tDateHoy."Period No.");
            IF tCompromiso.FINDFIRST() THEN BEGIN
                CLEAR(tCompromisoEncontrado);
                Encontrado := FALSE;

                REPEAT

                    //SI DESDE DIA ES MENOR Y HASTA DIA ES MAYOR ME QUEDO CON ESE
                    //ejemplo  de martes a jueves y metemos miercoles
                    IF (tCompromiso."Desde dia" < tDateHoy."Period No.") AND (tCompromiso."Hasta dia" > tDateHoy."Period No.") THEN
                        Encontrado := TRUE;

                    //por ejemplo de Sabado a Martes, luego si metemos el domingo ambos son menores
                    IF ((tCompromiso."Desde dia" < tDateHoy."Period No.") AND (tCompromiso."Hasta dia" < tDateHoy."Period No."))
                      AND (tCompromiso."Desde dia" > tCompromiso."Hasta dia")
                      AND (Encontrado = FALSE) THEN
                        Encontrado := TRUE;

                    //por ejemplo de Sabado a Martes, luego si metemos el domingo ambos son menores
                    IF ((tCompromiso."Desde dia" < tDateHoy."Period No.") AND (tCompromiso."Hasta dia" = tDateHoy."Period No."))
                      AND ((tCompromiso."Hasta hora" >= HoraPedido))
                      AND (Encontrado = FALSE) THEN
                        Encontrado := TRUE;

                    //si desde sabado a martes  y si metemos sabado
                    IF ((tCompromiso."Desde dia" = tDateHoy."Period No.") AND (tCompromiso."Desde hora" <= HoraPedido)) AND (tCompromiso."Hasta dia" < tDateHoy."Period No.")
                   AND (Encontrado = FALSE) THEN
                        Encontrado := TRUE;

                    //si desde sabado a martes y mete martes
                    IF (tCompromiso."Desde dia" > tDateHoy."Period No.") AND (tCompromiso."Hasta dia" = tDateHoy."Period No.")
                       AND (tCompromiso."Hasta hora" >= HoraPedido) THEN
                        Encontrado := TRUE;




                    //SI LA FECHA DESDE ES MENOR Y LA HORA HASTA >= A LA DEL PEDIDO NOS QUEDAMOS ESTE
                    //IF (tCompromiso."Desde dia" < tDateHoy."Period No.") AND (tCompromiso."Hasta hora" >= HoraPedido) AND (Encontrado = FALSE) THEN
                    //  Encontrado := TRUE;

                    //SI LA FCHA DESDE IGAUAL A LA FECHA Y LA FECHA HASTA
                    IF ((tCompromiso."Desde dia" = tDateHoy."Period No.") AND (tCompromiso."Hasta dia" = tDateHoy."Period No.")) AND
                       ((tCompromiso."Desde hora" <= HoraPedido) AND (tCompromiso."Hasta hora" >= HoraPedido)) AND (Encontrado = FALSE) THEN
                        Encontrado := TRUE;


                    //SI FECHA Y HORA ES IGUAL O MENOR PERO HASTA MAYOR NOS QUEDAMOS ESE

                    IF ((tCompromiso."Desde dia" <= tDateHoy."Period No.") AND (tCompromiso."Hasta dia" >= tDateHoy."Period No.")) AND
                       ((tCompromiso."Desde hora" <= HoraPedido)) AND (Encontrado = FALSE) THEN
                        Encontrado := TRUE;

                    IF Encontrado THEN
                        tCompromisoEncontrado := tCompromiso;

                UNTIL (tCompromiso.NEXT() = 0) OR (Encontrado);

            END ELSE
                //Si no encuentra combinacion
                ERROR(STRSUBSTNO(Error50000, CodCliente, FORMAT(FechaPedido), DiaActual));



            //CON EL ENCONTRADO BUSCAMOS EN FECHA MAYOR o IGUAL AL QUE ESTOY Y CON EL DIA QUE NOS COMPROMETEMOS
            IF Encontrado THEN BEGIN
                CLEAR(tDateComprometemos);
                tDateComprometemos.SETRANGE("Period Type", 0);  //DIA
                tDateComprometemos.SETFILTER("Period Start", '>=%1', FechaPedido); //FEcha pedido
                tDateComprometemos.SETRANGE("Period No.", tCompromisoEncontrado."Dia envio comprometido");
                tDateComprometemos.FINDFIRST();

                // SI FECHA REQUERIDA < FECHA es que no ha pedido a tiempo
                IF FechaRequerida < FechaPedido THEN BEGIN
                    IF EsTest THEN
                        ERROR('MARCAMOS COMO TARDE')
                    ELSE BEGIN
                        //Guardamos info en pedido           
                        T37."Cosmo Fecha comprometida" := tDateComprometemos."Period Start";
                        T37."Cosmo Dia comprometido" := tDateComprometemos."Period Name";
                        T37."Cosmo Solicitado en tiempo" := T37."Cosmo Solicitado en tiempo"::Tarde;
                    END;
                END ELSE BEGIN
                    IF EsTest THEN BEGIN
                        //si la fecha que nos pide es menor a la que nos comprometemos es que ha pedido tarde, no nos da tiempo
                        IF tDateComprometemos."Period Start" <= FechaRequerida THEN
                            MESSAGE('EN TIEMPO Fecha entrega : ' + FORMAT(tDateComprometemos."Period Start") + ' ' + tDateComprometemos."Period Name")
                        ELSE
                            MESSAGE('TARDE Fecha entrega : ' + FORMAT(tDateComprometemos."Period Start") + ' ' + tDateComprometemos."Period Name")
                    END ELSE BEGIN
                        T37."Cosmo Fecha comprometida" := tDateComprometemos."Period Start";
                        T37."Cosmo Dia comprometido" := tDateComprometemos."Period Name";
                        IF tDateComprometemos."Period Start" <= FechaRequerida THEN
                            T37."Cosmo Solicitado en tiempo" := T37."Cosmo Solicitado en tiempo"::"En tiempo"
                        ELSE
                            T37."Cosmo Solicitado en tiempo" := T37."Cosmo Solicitado en tiempo"::Tarde;
                    END;
                END;
            END ELSE
                ERROR(STRSUBSTNO(Error50000, CodCliente, FORMAT(FechaPedido), DiaActual));


        END;
    end;

    procedure On_Insert_Sales_Line(var Rec: Record "Sales Line")
    var
        T36: record "Sales Header";
    begin
        T36.get(rec."Document Type", rec."Document No.");
        Gestion_Claidad_Plazo_Envio(rec, Rec);

    end;

    procedure On_Modify_Sales_Line(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    var
        T36: record "Sales Header";
    begin
        T36.get(rec."Document Type", rec."Document No.");
        Control_Fecha_Requerida_En_Tiempo(rec, rec."Sell-to Customer No.", t36."Order Date", time(), rec."Requested Delivery Date", false);
        Gestion_Claidad_Plazo_Envio(rec, xRec);

    end;

    procedure On_Delete_Sales_Line(var Rec: Record "Sales Line")
    var
        T36: record "Sales Header";
    begin
        T36.get(rec."Document Type", rec."Document No.");
        Borrar_Lineas_Plazo_Envio(Rec);

    end;

    procedure On_Aftervalidate_RequestDate(Rec: record "Sales Line"; xRec: record "Sales Line")
    begin
        Control_Fecha_Requerida_En_tiempo(Rec, Rec."Sell-to Customer No.", 0D, 0T, 0D, FALSE);
        Gestion_Claidad_Plazo_Envio(xRec, Rec);
    end;

    procedure C80_OnAfterSalesShptLineInsert(SalesShipmentLine: record "Sales Shipment Line")
    Var
        lSalesShipmentHeader: Record "Sales Shipment Header";

    begin

        lSalesShipmentHeader.get(SalesShipmentLine."Document No.");
        Modifica_Lineas_Plazo_Envio_desde_T110(lSalesShipmentHeader, SalesShipmentLine);

    end;

}