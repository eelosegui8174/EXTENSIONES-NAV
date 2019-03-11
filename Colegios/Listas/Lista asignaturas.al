page 50105 "Lista asignaturas"
{
    PageType = List;
    SourceTable = Asignaturas;

    layout
    {
        area(content)
        {
            group("Datos Asignatura")
            {
                repeater(Asinaturas)
                {
                    field(Codigo; Codigo)
                    {
                        ApplicationArea = All;
                    }
                    field(Nombre; Nombre) { }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Asignatura)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Ficha: Page "Ficha Asignatura";
                begin
                    Page.RunModal(50103, rec);
                end;
            }
        }
    }

}