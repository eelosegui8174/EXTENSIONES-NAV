//https://docs.microsoft.com/es-es/dynamics365/business-central/dev-itpro/developer/devenv-cues-action-tiles#CueWideLayout
page 50311 CuePage
{
    PageType = Document;
    SourceTable = SalesInvoiceCueTable;

    layout
    {

        area(content)
        {
            group(grupo1)
            {
                cuegroup(SalesActionontainer)
                {

                    Caption = 'Sales Action container';
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
            group(otros)
            {
                cuegroup(SalesActionontainer2)
                {

                    Caption = 'Sales Action container 2';
                    actions
                    {

                        action(ActionName3)
                        {

                            Image = TileCyan;
                            trigger OnAction()
                            begin
                                message('a');
                            end;

                        }
                        action(ActionName4)
                        {
                            Image = TileLemon;
                            trigger OnAction()
                            begin
                                message('a');
                            end;
                        }
                    }

                }
            }
        }
        area(FactBoxes)
        {
            part(Sales; SalesCuePage)
            {
                Caption = ' ';

            }
            part(Purchase; PurchaseCuePage)
            {
                Caption = ' ';


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


