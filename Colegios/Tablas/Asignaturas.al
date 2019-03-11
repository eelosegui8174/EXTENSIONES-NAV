table 50103 Asignaturas
{
    CaptionML = ENU = 'Sunject', ESP = 'Asignaturas';

    fields
    {

        field(1; Codigo; Code[20])
        {
            CaptionML = ENU = 'Code', ESP = 'Código';
            NotBlank = true;
        }
        field(10; Nombre; Text[50])
        {
            CaptionML = ENU = 'Nmae', ESP = 'Nombre';
        }
        field(30; "Total Alumnos"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count ("Alumnos por asignatura" where (CodAsignatura = field (Codigo)));

        }
        field(31; "Edad media"; Decimal)
        {
            CaptionML = ENU = 'Average Age', ESP = 'Edad media';
            DecimalPlaces = 00;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average ("Alumnos por asignatura".Edad where (CodAsignatura = field (Codigo)));
        }
    }

    keys
    {
        key(PK; Codigo)
        {
            Clustered = true;
        }
    }

}