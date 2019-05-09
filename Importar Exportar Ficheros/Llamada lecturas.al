
page 50303 LlemadaFichero
{
    PageType = ConfirmationDialog;
    layout
    {
        area(Content)
        {
            cuegroup(Accion)
            {
                Caption = 'Llamadas';
                actions
                {
                    action(LeerFichero)
                    {
                        Caption = 'Leer fichero .TXT';
                        Image = TileSettings;
                        trigger OnAction()
                        var
                            GestionFicheros: Codeunit GestionFicheros;
                        begin
                            GestionFicheros.LeerFicheroTXT();
                        end;
                    }
                    action(LeerFicheroDotnet)
                    {
                        Caption = 'Leer fichero con DotNet';
                        Image = TileSettings;
                        trigger OnAction()
                        var
                            GestionFicheros: Codeunit GestionFicheros;
                        begin

                            GestionFicheros.LeerFicheroConDotNet();

                        end;

                    }
                }
            }
        }
    }
}
