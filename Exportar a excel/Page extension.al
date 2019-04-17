pageextension 50308 ExportToEscel extends "Item List"
{

    actions
    {
        addbefore("Ledger E&ntries")
        {
            action(ToExcel)
            {

                CaptionML = ENU = 'Export to excel', ESP = 'Exportar a excel';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true; //Número de decimales que queremos que tenga (0:0) sin restricción
                Image = Excel;
                trigger OnAction()
                Var
                    erec: record Item;

                begin
                    erec.setrange("No.", "No.");
                    if erec.FindFirst() then
                        report.RunModal(50308, TRUE, TRUE, erec);
                end;
            }
        }
    }


}