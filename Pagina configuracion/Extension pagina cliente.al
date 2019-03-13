pageextension 50102 Configurador extends "Customer List"
{


    actions
    {
        addfirst(Processing)
        {
            group(Traduction)
            {
                Caption = 'Configurator';
                action(Pagina)
                {
                    Caption = 'Configuration page';
                    trigger OnAction()
                    var
                        PageConfigurator: Page Configurador_Cliente;
                    begin
                        PageConfigurator.Run();
                    end;
                }
            }
        }
    }

    var
        myInt: Integer;
}