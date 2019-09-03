table 50402 Clientes
{
    CaptionML = ENU = 'Customers', ESP = 'Clientes';

    fields
    {
        field(1; "Codigo Taller"; Code[20])
        {
            CaptionML = ENU = 'Whorkshop Code', ESP = 'Código taller';
            TableRelation = Talleres;
        }
        field(2; "Codigo Cliente"; Code[20])
        {
            CaptionML = ENU = 'Customer Code', ESP = 'Código Cliente';
        }
        field(3; DNI; Code[20])
        {
            CaptionML = ENU = 'VAT', ESP = 'DNI';
        }
        field(10; "Nombre"; Text[50])
        {
            CaptionML = ENU = 'Name', ESP = 'Nombre';
        }
        field(20; "Apellido"; Text[50])
        {
            CaptionML = ENU = 'SurName', ESP = 'Apellido';
        }
        field(21; "Apellido2"; Text[50])
        {
            CaptionML = ENU = 'SurName 2', ESP = 'Apellido 2';
        }

        field(30; "Telefono"; Text[50])
        {
            CaptionML = ENU = 'Telephone', ESP = 'Teléfono';

        }

    }

    keys
    {
        key(PK; "Codigo Taller", "Codigo Cliente")
        {
            Clustered = true;
        }
    }

}