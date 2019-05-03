page 50318 Probar
{
    PageType = Worksheet;
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
                            Image = TileLightGreen;
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