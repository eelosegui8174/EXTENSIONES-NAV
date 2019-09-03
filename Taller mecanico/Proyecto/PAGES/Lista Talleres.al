page 50400 "Lista Talleres"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Talleres;

    layout
    {
        area(Content)
        {
            repeater(Talleres)
            {
                field(Codigo; Codigo) { }
                field(Nombre; Nombre) { }
                field(Empleados; Empleados) { }
                field(Clientes; Clientes) { }
                field(Direccion; Direccion) { }

                field(Direccion2; Direccion2)
                {
                    ApplicationArea = All;
                }
                field(CP; CP) { }
                field(Poblacion; Poblacion)
                {
                    ApplicationArea = All;
                }
                field(Provincia; Provincia)
                {
                    ApplicationArea = All;
                }
                field(Telefono; Telefono)
                {
                    ApplicationArea = All;
                }
                field(Web; Web)
                {
                    ApplicationArea = All;
                }
                field(Email; Email)
                {
                    ApplicationArea = All;
                }
                field(Logo; Logo)
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
            action(ListaEmpleados)
            {
                ApplicationArea = All;
                Image = Customer;
                Promoted = true;
                PromotedIsBig = true;
                CaptionML = ENU = 'Employers', ESP = 'Empleados';
                trigger OnAction();
                var
                    lEmpleados: record Empleados;
                    pEmpleados: page "Lista Empleados";
                begin
                    Clear(lEmpleados);
                    lEmpleados.SetRange("Codigo Taller", Codigo);
                    // if not lEmpleados.IsEmpty then begin
                    CLEAR(pEmpleados);
                    pEmpleados.SetTableView(lEmpleados);
                    pEmpleados.Run();
                    //end;
                end;
            }
            action(ListaClientes)
            {
                ApplicationArea = All;
                Image = Employee;
                Promoted = true;
                PromotedIsBig = true;
                CaptionML = ENU = 'Clientes', ESP = 'Clientes';
                trigger OnAction();
                var
                    lClientes: record Clientes;
                    pClientes: page "Lista clientes";
                begin
                    Clear(lClientes);
                    lClientes.SetRange("Codigo Taller", Codigo);
                    // if not lEmpleados.IsEmpty then begin
                    CLEAR(lClientes);
                    pClientes.SetTableView(lClientes);
                    pClientes.Run();
                    //enpClientesd;
                end;
            }
        }
    }
}