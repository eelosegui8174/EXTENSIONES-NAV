codeunit 50311 ImportarExcel
{
    trigger OnRun()
    begin
        if UploadIntoStream('Seleccione fichero', 'C:\', 'All Files(*.*)', FileName, FileInstream) then begin



        end;
    end;

    procedure OpenExcelBook(ServerFileName: Text)
    begin
        ExcelBuffer.OpenBook(FileName, 'TEST');
        ExcelBuffer.ReadSheet();
    end;

    procedure ExcelBookTotalRows() Rows: Integer
    begin
        EXIT(ExcelBuffer.Count);

    end;

    var
        ExcelBuffer: record "Excel Buffer";
        FileInstream: InStream;
        FileName: Text;
        ExcelCellValue: Text;
        I: Integer;
        TotalRows: Integer;
}