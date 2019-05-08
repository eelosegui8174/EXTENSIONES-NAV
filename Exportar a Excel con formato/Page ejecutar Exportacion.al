page 50320 ExportToEscel
{
    PageType = ConfirmationDialog;


    layout
    {
        area(Content)
        {
            cuegroup(Accion)
            {
                Caption = 'Exportar productos';
                actions
                {
                    action(Exportar)
                    {
                        Image = TileSettings;
                        trigger OnAction()

                        var
                            Exportar: Codeunit ExportarAExcelFont;
                        begin
                            Exportar.run;
                        end;
                    }
                }
            }
        }
    }



    var
        myInt: Integer;
}
