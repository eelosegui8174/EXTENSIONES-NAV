pageextension 50303 LlemadaFichero extends "Customer List"
{
    actions
    {
        addafter("Sales Journal")
        {
            action(LeerFichero)
            {

                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Select;
                trigger OnAction()
                var
                    GestionFicheros: Codeunit GestionFicheros;
                begin
                    GestionFicheros.LeerFichero();
                    MESSAGE(FORMAT(Name));

                end;

            }

        }
    }
}