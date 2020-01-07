pageextension 50104 "Cosmo PagePedidoVenta" extends "Sales Order" //MyTargetPageId
{

    actions
    {

        addafter(Approval)
        {
            action(CosmoConfAprobaciones)
            {
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
            }
            action(CosmoLogCalidadEnvios)
            {
                image = Log;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
            }
        }

    }
}