page 50315 "Ejecutar json"
{
    PageType = ConfirmationDialog;


    layout
    {
        area(Content)
        {
            cuegroup(Accion)
            {
                Caption = 'Crear Json';
                actions
                {
                    action(CrearJson)
                    {
                        Image = TileLightGreen;
                        trigger OnAction()
                        var
                            Crear_Json: Codeunit "Generar fichero Json";
                        begin
                            Crear_Json.Crear_Fichero_Json();
                        end;
                    }
                }
            }
        }
    }



    var
        myInt: Integer;
}
