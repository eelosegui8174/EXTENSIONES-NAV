pageextension 50105 "CosmoPageHistAlbaranVenta" extends 130
{

    actions
    {
        addafter("&Navigate")
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