pageextension 50303 LlemadaFichero extends "Customer List"
{
    actions
    {
        addafter("Sales Journal")
        {
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
                    GestionFicheros.LeerFicheroTXT();();
                end;

            }

        }
    }
}