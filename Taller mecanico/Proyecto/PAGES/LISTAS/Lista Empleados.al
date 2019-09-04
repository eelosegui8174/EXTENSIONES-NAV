page 50401 "Lista Empleados"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Empleados;
    CardPageId = "Ficha empleado";
    layout
    {
        area(Content)
        {
            repeater(Empleados)
            {
                field("Codigo Taller"; "Codigo Taller")
                {
                    ApplicationArea = All;
                }
                field("Codigo Empleado"; "Codigo Empleado")
                {
                    ApplicationArea = All;
                }
                field(DNI; DNI)
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

                field(Telefono; Telefono)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(FichaEmpleado)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Employ card', ESP = 'Ficha empleado';
                Image = Employee;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction();
                var
                    lFichaEmpleado: Page "Ficha empleado";
                    lEmpleado: Record Empleados;
                begin
                    CLEAR(lEmpleado);
                    lEmpleado.SetRange("Codigo Empleado", "Codigo Empleado");
                    lFichaEmpleado.SetTableView(lEmpleado);
                    lFichaEmpleado.Run();
                end;
            }
        }
    }
}