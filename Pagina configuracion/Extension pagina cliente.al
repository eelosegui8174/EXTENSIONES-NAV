<<<<<<< HEAD
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
=======
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
>>>>>>> 7ebc8907635d9d20980cdd61fd91b3032026485d
}