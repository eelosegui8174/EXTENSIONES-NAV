page 50405 "FactBox Info Taller"
{
    PageType = CardPart;
    Editable = false;
    SourceTable = Talleres;

    layout
    {

        area(Content)
        {
            group(Info)
            {
                field(Empleados; Empleados)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'EMployers', ESP = 'Empleados';
                }
                field(Clientes; Clientes)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Customers', ESP = 'Clientes';
                }
            }
        }
    }

    actions
    {
        area(Processing)
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