pageextension 50100 AccionALumnos extends "Customer List"
{
    layout
    {

    }

    actions
    {
        addbefore("Bank Accounts")
        {
            action(Alumnos)
            {
                Image = Customer;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = page "Lista Alumnos";

            }
            action(Colegio)
            {
                Image = AddToHome;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = page "Pagina Colegio";
            }
        }
    }


    var
        myInt: Integer;
}