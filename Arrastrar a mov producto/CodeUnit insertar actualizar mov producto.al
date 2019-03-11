codeunit 50204 Eventos
{

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure Arrastrar_Campos_Cliente(var ItemLedgerentry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    var
        Cliente: Record Customer;
    begin
        if ItemLedgerentry."Entry Type" = ItemLedgerentry."Entry Type"::Sale then begin
            CLEAR(Cliente);
            if Cliente.get(ItemLedgerentry."Source No.") then begin
                ItemLedgerentry.Nick := Cliente.Nick;
                ItemLedgerentry.Color := cliente.Color;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostSalesDoc', '', false, false)]
    local procedure Antes_De_Registrar_C80(VAR SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean)
    var
    begin
    end;
}