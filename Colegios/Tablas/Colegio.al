table 50100 Colegio
{
    CaptionML = ENU = 'School', ESP = 'Colegio';
    DataPerCompany = true;
    Description = 'Prueba colegio';
    //...

    fields
    {
        field(1; Nombre; Text[50])
        {
            //ejemplos de propiedades
            CaptionML = ENU = 'Name', ESP = 'Nombre Colegio';
            Description = 'Nombre del colegio.';
            Editable = true;
        }
        field(10; Direccion1; Text[50])
        { }
        field(20; Direccion2; Text[50])
        { }
        field(30; "Codigo postal"; Code[20])
        {

        }
        field(40; Poblacion; Text[50])
        {
            trigger OnValidate()
            begin
                producto.Validate(Description);
            end;
        }
        field(50; Pais; Text[50])
        { }
        field(60; Imagen; Blob)
        {
        }
        field(70; TotalalumnosPrincipiantes; Integer)
        {
            CaptionML = ENU = 'Total Beginner students', ESP = 'Total alumnos principiantes';
            FieldClass = FlowField;
            CalcFormula = count (Alumnos where (Nivel = const (Principiante)));
        }
        field(75; TotalalumnosMedios; Integer)
        {
            CaptionML = ENU = 'Total Medium students', ESP = 'Total alumnos medios';
            FieldClass = FlowField;
            CalcFormula = count (Alumnos where (Nivel = const (Medio)));
        }
        field(80; TotalalumnosAvanzados; Integer)
        {
            CaptionML = ENU = 'Total Advance students', ESP = 'Total alumnos Avanzados';
            FieldClass = FlowField;
            CalcFormula = count (Alumnos where (Nivel = const (Avanzado)));
        }
        field(90; MasJoven; Integer)
        {
            CaptionML = ENU = 'More younger', ESP = 'Mas joven';

            FieldClass = FlowField;
            CalcFormula = min (Alumnos.Edad);


            //CalcFormula = lookup(Alumnos.Nombre where (Edad =filter(>20),
            //                                   Nombre=filter('???'),
            //                                   Apellido=field(Nombre)));



        }
        field(100; NombreJoven; text[50])
        {

            trigger OnLookup()
            var
                Alumno: Record Alumnos;
                PageAlumno: Page "Lista Alumnos";
                error1: TextConst ENU = 'There is nothing.', ESP = 'No hay resultados';

            begin

                Alumno.Reset;
                alumno.SetRange(Alumno.Edad, MasJoven);
                if Alumno.FindFirst then begin
                    Clear(PageAlumno);
                    PageAlumno.SetTableView(Alumno);
                    PageAlumno.Editable(false);
                    PageAlumno.LookupMode(true);
                    PageAlumno.Run;
                end else
                    Message(error1)
            end;
        }
    }

    keys
    {
        key(PK; Nombre)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        producto: Record Item;

    trigger OnInsert()

    begin

    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;

}