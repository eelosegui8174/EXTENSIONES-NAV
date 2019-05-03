page 50318 Probar
{
    PageType = ConfirmationDialog;
    layout
    {

        area(Content)
        {

            cuegroup(Accion)
            {

                Caption = 'Generar XML';
                actions
                {
                    action(Nombre)
                    {
                        Caption = 'Generar xml';
                        Image = TileSettings;

                        trigger OnAction()
                        var
                            ObjetoLazar: Codeunit Generar_XML;
                        begin
                            ObjetoLazar.Run();
                        end;

                    }
                }
            }

        }
    }
}