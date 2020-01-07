pageextension 50100 "Cosmo ListaCLienteCalidad" extends "Customer List" //MyTargetPageId
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