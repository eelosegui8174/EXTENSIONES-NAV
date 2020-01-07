table 50103 "Cosmo Log Calidad plazos envio"
{

    fields
    {
        field(1; "No. pedido"; Code[20])
        {
            DataClassification = CustomerContent;

        }
        field(2; "Linea pedido"; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(3; "Fecha envio"; Date)
        {
            DataClassification = CustomerContent;

        }
        field(4; "Fecha pedido"; Date)
        {
            DataClassification = CustomerContent;

        }
        field(10; "No. cliente"; Code[10])
        {
            DataClassification = CustomerContent;

        }
        field(11; "Nombre cliente"; Text[30])
        {
            DataClassification = CustomerContent;

        }
        field(50; "No. producto"; Code[10])
        {
            DataClassification = CustomerContent;

        }
        field(51; Descripcion; Text[30])
        {
            DataClassification = CustomerContent;

        }
        field(60; "Cantidad linea"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(61; "Cantidad pendiente"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(70; "Fecha entrega requerida"; Date)
        {
            DataClassification = CustomerContent;

        }
        field(71; "Dia solicitud requerida"; Text[30])
        {
            DataClassification = CustomerContent;

        }
        field(72; "Fecha comprometida"; Date)
        {
            DataClassification = CustomerContent;

        }
        field(73; "Dia comprometido"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(74; "Solicitado en tiempo"; Option)
        {
            DataClassification = CustomerContent;

            OptionMembers = " ","En tiempo",Tarde;
        }
        field(80; "Enviado en tiempo"; Option)
        {
            DataClassification = CustomerContent;

            OptionMembers = " ","En tiempo",Tarde;
        }
        field(81; "Cantidad enviada"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(82; "Porcentaje enviado pedido"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(83; "Cant. solicitado OT"; Decimal)
        {
            DataClassification = CustomerContent;

            Description = 'no son campos calculados';
        }
        field(84; "Cant. solicitado T"; Decimal)
        {
            DataClassification = CustomerContent;

            Description = 'no son campos calculados';
        }
        field(90; "Total enviado  linea"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum ("cosmo Log Calidad plazos envio"."Cantidad enviada" where ("No. pedido" = field ("No. pedido"), "Linea pedido" = field ("Linea pedido")));
        }
        field(91; "Total enviado linea OT"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum ("cosmo Log Calidad plazos envio"."Cantidad enviada" WHERE ("No. pedido" = FIELD ("No. pedido"), "Linea pedido" = FIELD ("Linea pedido"), "Enviado en tiempo" = FILTER ("En tiempo")));
        }
        field(92; "Total enviado linea L"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(93; "Porc. cantidad en tiempo linea"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(94; "Total cantidad pedido"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(95; "Total cantidad pendiente"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(100; "Total enviado pedido"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum ("Cosmo Log Calidad plazos envio"."Cantidad enviada" WHERE ("No. pedido" = FIELD ("No. pedido")));

        }
        field(101; "Total enviado pedido OT"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum ("Cosmo Log Calidad plazos envio"."Cantidad enviada" WHERE ("No. pedido" = FIELD ("No. pedido"), "Enviado en tiempo" = FILTER ("En tiempo")));

        }
        field(102; "Total enviado pedido L"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum ("Cosmo Log Calidad plazos envio"."Cantidad enviada" WHERE ("No. pedido" = FIELD ("No. pedido"), "Enviado en tiempo" = FILTER (Tarde)));

        }
        field(103; "Porc. cantidad en tiempo ped."; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(110; "Total solicitado OT"; Decimal)
        {
            DataClassification = CustomerContent;

            Description = 'no son campos calculados';
        }
        field(111; "Total solicitado T"; Decimal)
        {
            DataClassification = CustomerContent;

            Description = 'no son campos calculados';
        }
    }

    keys
    {
        key(Key1; "No. pedido", "Linea pedido", "Fecha envio")
        {
        }
    }

    fieldgroups
    {
    }
}

