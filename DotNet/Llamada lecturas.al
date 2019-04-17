
pageextension 50307 CustomerListExt extends "Customer List"
{
    var 
        [WithEvents]
        timer: DotNet MyTimer;
    
    trigger OnOpenPage()
    begin
        SetupTimer();
    end;

    procedure SetupTimer()
    begin 
        timer := timer.Timer(2000);
        timer.AutoReset := true;
        timer.Enabled := true; 
        timer.Start();
    end;

    trigger timer::Elapsed(sender: Variant; e: DotNet MyElapsedEventArgs)
    begin
     // Print a message when this event is published 
        Message('%1', e.SignalTime());
        timer.Stop();
    end;
}