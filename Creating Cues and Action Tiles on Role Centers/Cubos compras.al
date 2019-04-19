page 50313 PurchaseCuePage
{
    PageType = CardPart;
    SourceTable = SalesInvoiceCueTable;

    layout
    {

        area(content)
        {

            cuegroup(group)
            {
                Caption = 'Sales Documents';
                //CuegroupLayout = Wide;  //Si ponemos Wide oculta el texto encima de los cuadros
                field(PurchaseOrder; SalesOrders)
                {
                    Caption = 'Orders';
                    DrillDownPageId = "Purchase Orders";
                }
                field(PurchaseInvoice; SalesInvoicesOpen)
                {
                    Caption = 'Invoices';
                    DrillDownPageId = "Purchase Invoices";
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


