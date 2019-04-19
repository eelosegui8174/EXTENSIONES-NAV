//https://docs.microsoft.com/es-es/dynamics365/business-central/dev-itpro/developer/devenv-cues-action-tiles#CueWideLayout
page 50311 CuePage
{
    PageType = Card;
    SourceTable = SalesInvoiceCueTable;

    layout
    {

        area(content)
        {

            group(cubos)
            {

                cuegroup(SalesActionontainer)
                {

                    Caption = '';
                    actions
                    {

                        action(ActionName)
                        {

                            Image = TileSettings;
                            trigger OnAction()
                            begin
                                message('a');
                            end;

                        }
                        action(ActionName2)
                        {
                            Image = TileCurrency;
                            trigger OnAction()
                            begin
                                message('a');
                            end;
                        }
                    }

                }
            }
            part(Sales; SalesCuePage)
            {
                Caption = 'Sales Cues';

            }
            part(Purchase; PurchaseCuePage)
            {
                Caption = 'Purchases Cues';

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


