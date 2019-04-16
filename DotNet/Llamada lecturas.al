
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

                        GestionFicheros.LeerFicheroConDotNet();

                    end;

                }
                action(Input)
                {
                    //Caption = 'Texto';//si  usamos  fichero de traducciones o no queremos otro idioma
                    CaptionML = ENU = 'Text', ESP = 'input'; //si no usamos  fichero de traducciones
                    Promoted = true;
                    PromotedCategory = new; //New,Process,Report,Category4,Category5...Category10
                    PromotedIsBig = true; //Número de decimales que queremos que tenga (0:0) sin restricción
                    Image = Card;

                    trigger OnAction()
                    Var
                        //       input: Codeunit InputBox;
                        Input: codeunit InputBox;

                    begin
                        //    input.Run();
                        Input.run;

                    end;
                }
            }
        }
    }
}