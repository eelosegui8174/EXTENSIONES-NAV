table 50401 Empleados
{
    CaptionML = ENU = 'Employers', ESP = 'Empleados';

    fields
    {
        field(1; "Codigo Taller"; Code[20])
        {
            CaptionML = ENU = 'Whorkshop Code', ESP = 'Código taller';
            TableRelation = Talleres;
        }
        field(2; "Codigo Empleado"; Code[20])
        {
            CaptionML = ENU = 'Employer Code', ESP = 'Código empleado';
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
        key(PK; "Codigo Taller", "Codigo Empleado")
        {
            Clustered = true;
        }
    }

}