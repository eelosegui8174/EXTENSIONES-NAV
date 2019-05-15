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
                            ObjetoLazar: Codeunit Generar_XML_1;
                        begin
                            ObjetoLazar.Run();
                        end;

                    }

                    action(Nombre2)
                    {
                        Caption = 'Generar xml desde codeunit';
                        Image = TileSettings;

                        trigger OnAction()
                        var
                            ObjetoLazar: Codeunit Generar_XML_1;
                        begin
                            ObjetoLazar.Exportar_Con_Codeunit_Export();
                        end;

                    }
                }
            }
        }

    }
}
