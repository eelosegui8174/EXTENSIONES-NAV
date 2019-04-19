page 50312 SalesCuePage
{
    PageType = CardPart;
    SourceTable = SalesInvoiceCueTable;

    layout
    {

        area(content)
        {

            cuegroup(SalesCueContainer)
            {
                Caption = 'Sales Documents';
                // CuegroupLayout=Wide;   //Si ponemos Wide oculta el texto encima de los cuadros

                field(SalesOrder; SalesOrders)
                {

                    Caption = 'Orders';
                    DrillDownPageId = "Sales Orders";
                }
                field(SalesInvoice; SalesInvoicesOpen)
                {
                    Caption = 'Invoices';
                    DrillDownPageId = "Sales Invoice List";
                }
            }


        }

    }

    trigger OnOpenPage();
    begin
        RESET;
        if not get then begin
            INIT;
            INSERT;
        end;
        CurrPage.Caption := '';
    end;
}


