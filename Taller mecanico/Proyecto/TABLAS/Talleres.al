table 50400 Talleres
{
    CaptionML = ENU = 'WorkShop', ESP = 'Taller';

    fields
    {
        field(1; "Codigo"; Code[20])
        {
            CaptionML = ENU = 'Code', ESP = 'Código';
        }
        field(10; "Nombre"; Text[50])
        {
            CaptionML = ENU = 'Name', ESP = 'Nombre';
        }
        field(20; "Direccion"; Text[50])
        {
            CaptionML = ENU = 'Direcction', ESP = 'Dirección';
        }
        field(21; "Direccion2"; Text[50])
        {
            CaptionML = ENU = 'Direcction 2', ESP = 'Dirección 2';
        }
        field(22; "CP"; Code[20])
        {
            CaptionML = ENU = 'Post code', ESP = 'Código postal';
            TableRelation = "Post Code";
            trigger OnValidate()
            var
                PostCode: Record "Post Code";
                RegionCode: code[10];
            begin
                PostCode.ValidatePostCode(Poblacion, CP, Provincia, RegionCode, (CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(23; "Poblacion"; Text[50])
        {
            CaptionML = ENU = 'City', ESP = 'Población';
        }
        field(24; "Provincia"; Text[50])
        {
            CaptionML = ENU = 'County', ESP = 'Provincia';
        }

        field(30; "Telefono"; Text[50])
        {
            CaptionML = ENU = 'Telephone', ESP = 'Teléfono';
        }
        field(40; "Email"; Text[200])
        {
            CaptionML = ENU = 'Email', ESP = 'Email';
            trigger OnValidate()
            var
                MailManagement: codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField(Email);
            end;
        }
        field(41; "Web"; Text[200])
        {
            CaptionML = ENU = 'Web', ESP = 'Web';
        }
        field(50; "Logo"; Blob)
        {
            Subtype = Bitmap;
            CaptionML = ENU = 'Logo', ESP = 'Logo';
        }
        field(55; Empleados; integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count (Empleados where ("Codigo Taller" = field (Codigo)));

        }
        field(56; Clientes; integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count (Clientes where ("Codigo Taller" = field (Codigo)));

        }
    }

    keys
    {
        key(PK; Codigo)
        {
            Clustered = true;
        }
    }
    var

}