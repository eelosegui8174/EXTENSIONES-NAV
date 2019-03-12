pageextension 50131 Traduccion extends "Customer List"
{


    actions
    {
        addfirst(Navigation)
        {
            group(Traduction)
            {
                Caption = 'Traduction';
                action(Pagina)
                {
                    Caption = 'Traduced page';
                    trigger OnAction()
                    var
                        PageTraducida: Page Pagina_ejemplo_traducciones;
                    begin
                        PageTraducida.Run();
                    end;
                }
            }
            group(TextBuilder)
            {
                Caption = 'TextBuilder';
                action(TextoBuilder)
                {
                    Caption = 'Text-Builder';
                    trigger
                    OnAction()
                    var
                        pageTextBuilder: Page Text_Builder;
                    begin
                        pageTextBuilder.Run();
                    end;
                }

            }
        }
    }

    var
        myInt: Integer;
}