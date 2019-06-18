codeunit 50322 blabaa
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostItemChargePerOrder', '', true, true)]
    local procedure "Sales-Post_OnBeforePostItemChargePerOrder"
    (
        var SalesHeader: Record "Sales Header";
        var SalesLine: Record "Sales Line";
        var ItemJnlLine2: Record "Item Journal Line";
        var ItemChargeSalesLine: Record "Sales Line";
        CommitIsSuppressed: Boolean
    )
    begin

    end;

}