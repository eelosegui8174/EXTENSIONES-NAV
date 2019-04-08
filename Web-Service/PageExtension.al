pageextension 50301 CurrencyList extends Currencies
{

    actions
    {
        addafter("Exch. &Rates")
        {
            action(GetExchangeExt)
            {
                CaptionML = ENU = 'Get Exchange Rate', ESP = 'Recuperar divisa';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Calculate;
                trigger OnAction()
                var
                    GetExchange: Codeunit GetExchangeExt;
                begin
                    GetExchange.GetExchangeExt(Rec);
                end;

            }
        }

    }

    var
        myInt: Integer;
}