pageextension 50202 CamposPageCLiente extends "Customer Card"
{

    layout
    {
        addafter("Address & Contact")
        {
            group(gNick)
            {
                field(Nick; Nick)
                {
                    Importance = Promoted;
                }
                field(Color; Color) { }
                field(Equipo; Equipo) { }

            }
        }

    }

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




pageextension 50203 CamposPageMovProducto extends "Item Ledger Entries"
{
    layout
    {
        addafter(Quantity)
        {

            field(Nick; Nick)
            {
                ShowMandatory = true;
            }
            field(Color; Color) { }
            field(Equipo; Equipo) { }
        }
    }


}
