page 50402 "Lista clientes"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Clientes;

    layout
    {
        area(Content)
        {
            repeater(Clientes)
            {
                field("Codigo Taller"; "Codigo Taller")
                {
                    ApplicationArea = All;
                }
                field("Codigo Empleado"; "Codigo Cliente")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Nombre; Nombre)
                {
                    ApplicationArea = All;
                }
                field(Apellido; Apellido)
                {
                    ApplicationArea = All;
                }
                field(Apellido2; Apellido2)
                {
                    ApplicationArea = All;
                }


                field(DNI; DNI)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }

                field(Telefono; Telefono)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
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

                trigger OnAction();
                begin

                end;
            }
        }
    }
}