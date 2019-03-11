page 50104 "Lista alumnos por asignatura"
{
    PageType = CardPart;
    SourceTable = "Alumnos por asignatura";

    layout
    {
        area(content)
        {
            group(Alumnos)
            {
                repeater(Lista)
                {
                    field(DNI; DNI)
                    {
                        ApplicationArea = All;

                    }
                    field(Nombre; Nombre)
                    {
                        Editable = false;
                    }
                    field(Edad; Edad)
                    {
                        Editable = false;
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}