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
            action(ToExcelCodeunit)
            {

                CaptionML = ENU = 'Export to excel by codeunit', ESP = 'Exportar a excel por codeunit';
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true; //Número de decimales que queremos que tenga (0:0) sin restricción
                Image = Excel;
                trigger OnAction()
                Var
                    erec: record Item;

                begin
                    erec.setfilter("No.", '%1..%2', '1000', '1150');
                    if erec.FindFirst() then
                        Codeunit.run(codeunit::ExportarAExcel);

                end;
            }
            action(ImportExcel)
            {
                //Caption = 'Texto';//si  usamos  fichero de traducciones o no queremos otro idioma
                CaptionML = ENU = 'Import Excel', ESP = 'Importar Excel'; //si no usamos  fichero de traducciones
                Promoted = true;
                PromotedCategory = Report; //New,Process,Report,Category4,Category5...Category10
                PromotedIsBig = true; //Número de decimales que queremos que tenga (0:0) sin restricción
                Image = Import;
                trigger OnAction()

                begin
                    Codeunit.Run(Codeunit::ImportarExcel);
                end;
            }
        }
    }


}