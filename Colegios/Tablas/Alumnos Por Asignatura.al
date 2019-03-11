table 50104 "Alumnos por asignatura"
{
    CaptionML = ENU = 'Students per subject', ESP = 'Alumnos por asignatura';


    fields
    {
        field(1; CodAsignatura; Code[20])
        {
            TableRelation = Asignaturas.Codigo;
        }
        field(10; "Nombre Asignature"; Text[50])
        {
            CaptionML = ENU = 'Subect name', ESP = 'Nombre Asignatura';
            FieldClass = FlowField;
            CalcFormula = lookup (Asignaturas.Nombre where (Codigo = field (CodAsignatura)));
        }
        field(20; DNI; Code[30])
        {
            TableRelation = Alumnos.DNI;
            trigger OnValidate()
            var
                cColegio: Codeunit colegio;
            begin
                if DNI <> '' then
                    Edad := cColegio.Dame_Edad(DNI)
                else
                    Edad := 0;
            end;

        }
        field(21; Nombre; Text[50])
        {
            Editable = falsE;
            FieldClass = FlowField;
            CalcFormula = lookup (Alumnos.Nombre where (DNI = field (DNI)));

        }
        field(23; Edad; Integer)
        {

        }
    }

    keys
    {
        key(PK; CodAsignatura, DNI)
        {
            Clustered = true;
        }
    }

}