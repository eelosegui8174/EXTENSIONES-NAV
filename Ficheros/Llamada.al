
pageextension 50303 LlemadaFichero extends "Customer List"
{
    actions
    {
        addafter("Sales Journal")
        {
            group(Lecturas)
            {
                Caption = 'Lecturas ficheros';
                action(LeerFichero)
                {
                    Caption = 'Leer fichero .TXT';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Select;
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
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Select;
                    trigger OnAction()
                    var
                        GestionFicheros: Codeunit GestionFicheros;
                    begin
                        //mensaje con todo 
                        GestionFicheros.LeerFicheroConDotNet(true);
                        //mensaje de cada linea
                        GestionFicheros.LeerFicheroConDotNet(false);

                    end;

                }
            }

        }
    }
}