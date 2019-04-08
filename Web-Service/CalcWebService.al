codeunit 50300 CalcWebService
{
     procedure GetExchangeExt (Currency: Record Currency)
     var 
        HttpClient : HttpClient;
        HttpResponse : HttpResponseMessage;
        ResponseText : Text;
        Url : Text;
        GeneralLedgerSetup : Record "General Ledger Setup";
     begin

         GeneralLedgerSetup.FindFirst;

         Url := StrSubstNo('http://api.fixer.io/latest?base=%1&symbols=%2',
                GeneralLedgerSetup.GetCurrencyCode(''),Currency.Code);

         if HttpClient.Get(Url,HttpResponse) then begin
             HttpResponse.Content.ReadAs(ResponseText);
             Message(ResponseText);
         end;

     end;
    
    var
        myInt: Integer;
}