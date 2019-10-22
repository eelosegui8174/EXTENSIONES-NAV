page 50400 "Lista Talleres"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Talleres;
    CardPageId = "Ficha taller";
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
                PromotedCategory = Process;
                CaptionML = ENU = 'Employers', ESP = 'Empleados';
                trigger OnAction();
                var
                    lEmpleados: record Employee;
                    pEmpleados: page "Employee List";
                begin
                    Clear(lEmpleados);
                    lEmpleados.SetRange("Codigo Taller", Codigo);
                    // if not lEmpleados.IsEmpty then begin

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
                PromotedCategory = Process;
                CaptionML = ENU = 'Clientes', ESP = 'Clientes';
                trigger OnAction();
                var
                    lClientes: record Customer;
                    pClientes: page "Customer List";
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
            action(ListaVehiculos)
            {
                ApplicationArea = All;
                Image = ShipAddress;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                CaptionML = ENU = 'Vehicles', ESP = 'Vehículos';
                trigger OnAction();
                var
                    lVehiculos: record Vehiculos;
                    pVehiculos: page "Lista vehiculos";
                begin
                    Clear(lVehiculos);
                    lVehiculos.SetRange("Codigo Taller", Codigo);
                    // if not lEmpleados.IsEmpty then begin

                    pVehiculos.SetTableView(lVehiculos);
                    pVehiculos.Run();
                    //enpClientesd;
                end;
            }
        }
    }


}