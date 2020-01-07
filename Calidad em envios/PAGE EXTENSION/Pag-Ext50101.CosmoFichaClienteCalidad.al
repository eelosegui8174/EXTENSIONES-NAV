pageextension 50101 "CosmoFichaClienteCalidad" extends "Customer Card" //MyTargetPageId
{

    actions
    {

        addafter(ApprovalEntries)
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