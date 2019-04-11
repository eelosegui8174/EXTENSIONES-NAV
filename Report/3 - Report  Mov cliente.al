report 50206 Mov_Cliente
{
    CaptionML = ENU = 'Customer Item ledger entry', ESP = 'Movimientos de producto cliente';
    UsageCategory = Lists;
    ApplicationArea = All;

    RDLCLayout = '.\REPORTS\CustomerLedgerEntry.rdl';
    WordLayout = '.\REPORTS\CustomerLedgerEntry.docx';


    dataset
    {
        dataitem(Customer; Customer)
        {
            //para poder filtrar por estos campos
            RequestFilterFields = "No.";
            column(Filtros; Customer.GetFilters()) { }
            column(CodCliente; "No.") { }
            column(Nombre; Name) { }
            column(Dir1; Address) { }
            column(dir2; "Address 2") { }
            column(Usuario; userid) { }

            //MOVIMIENTOS DE PRODUCTO PARA EL CLIENTE
            dataitem(MovCliente; "Item Ledger Entry")
            {
                //Relacionamos con el cliente
                DataItemTableView = sorting ("Entry No.");
                DataItemLinkReference = Customer;
                DataItemLink = "Source No." = field ("No.");

                column(SourceType; "Source type") { }
                column(lineas; MovCliente.Count()) { }
                column(Mov; "Entry No.") { }
                column(Cliente; "Source No.") { }
                column(NombreCliente; NombreCliente) { }
                column(Producto; "Item No.") { }
                column(Descripcion; eProducto.Description) { }
                column(Cantidad; Quantity) { }

                trigger OnAfterGetRecord()
                begin

                    if cliente.GET(MovCliente."Source No.") then;
                    if eProducto.GET(MovCliente."Item No.") then;



                end;


            }
        }
    }


    labels
    {
        label(ReportCaption; ENU = 'CUSTOMER LEDGER ENTRY', ESP = 'MOVIMIENTOS DE CLIENTE')
        label(Filtro; ENU = 'Filters: ', ESP = 'Filtros: ')
    }

    var
        cliente: record customer;
        eProducto: Record Item;
        NombreCliente: Text;

        vARNUEVA: Decimal;
        VAR2: Integer;
}