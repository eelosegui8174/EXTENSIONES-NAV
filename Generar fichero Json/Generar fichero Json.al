codeunit 50314 "Generar fichero Json"
{
    procedure Crear_Fichero_Json()
    begin

        CLEAR(vItem);
        vitem.Setfilter("No.", '1000', '1750');
        if vitem.FindFirst() then begin

            //Creamos la linea principal del producto
            Crear_Linea_Producto();

            //Creamos las lineas de detalle de mov producto
            CLEAR(vITemLedgerEntry);
            vITemLedgerEntry.SETRANGE(vITemLedgerEntry."Item No.", vItem."No.");
            IF vITemLedgerEntry.findset then Begin

                //Inicalizamos la estructura de detalle de las lineas
                Inicializar_Linea_Mov_Producto();

                Repeat
                    //creamos las lineas de detalle en un array
                    Crear_Linea_Mov_Producto();
                Until vITemLedgerEntry.Next = 0;

                //Insertamos esas lineas del array en el fichero Json
            End
        end;

    end;


    local procedure Crear_Linea_Producto()
    begin
        vJsonObjectHeader.Add(vItem.FieldCaption("No."), vItem."No.");
        vJsonObjectHeader.Add(vItem.FieldCaption(Description), vItem.Description);
        vJsonArray.Add(vJsonObjectHeader);
    end;

    local procedure Inicializar_Linea_Mov_Producto()
    begin
        VJsonObjectLines.Add(vITemLedgerEntry.FieldCaption("Location Code"), '');
        VJsonObjectLines.Add(vITemLedgerEntry.FieldCaption(Quantity), '');
        VJsonObjectLines.Add(vITemLedgerEntry.FieldCaption("Document Date"), '');

    end;

    local procedure Crear_Linea_Mov_Producto()
    begin
        //Preparamos los valores
        VJsonObjectLines.Add(vITemLedgerEntry.FieldCaption("Location Code"), vITemLedgerEntry."Location Code");
        VJsonObjectLines.Add(vITemLedgerEntry.FieldCaption(Quantity), vITemLedgerEntry.Quantity);
        VJsonObjectLines.Add(vITemLedgerEntry.FieldCaption("Document Date"), vITemLedgerEntry."Document Date");

        //Rellenamos el array
        vJsonArrayLines.Add(vJsonObjectLines);
    end;

    local procedure Insertar_Array_Lineas_En_Fichero()
    begin
        vJsonArray.Add(vJsonArrayLines);
    end;

    var
        vJsonObjectHeader: JsonObject;
        vJsonObjectLines: JsonObject;
        vJsonArray: JsonArray;
        vJsonArrayLines: JsonArray;

        vItem: Record Item;
        vITemLedgerEntry: record "Item Ledger Entry";
}