pageextension 50202 CamposPageCLiente extends "Customer Card"
{


    actions
    {
        addbefore("Report Customer - Labels")
        {
            action(Movimientos)
            {
                PromotedCategory = Report;
                Promoted = true;
                Image = Report2;
                trigger OnAction()
                var
                    MovCLiente: Report Mov_Cliente;
                    eCliente: Record Customer;
                begin
                    ecliente.setrange("No.", rec."No.");

                    MovCLiente.SetTableView(ecliente);
                    MovCLiente.run;
                end;
            }
        }
    }


}



