page 50103 "Ficha Asignatura"
{
    PageType = Document;
    SourceTable = Asignaturas;


    layout
    {
        area(content)
        {
            group(General)
            {
                field(Codigo; Codigo)
                {
                    ApplicationArea = All;

                }
                field(Nombre; Nombre)
                {
                    ApplicationArea = All;
                }
            }
            group(Datos)
            {
                field("Total Alumnos"; "Total Alumnos") { }
                field("Edad media"; "Edad media") { }

            }
            group(Alumnos)
            {
                part(Lista; "Lista alumnos por asignatura")
                {
                    SubPageLink = CodAsignatura = field (Codigo);
                }
            }
        }
    }


}