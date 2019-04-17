report 50308 ItemToExport
{
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
        dataitem(Productos; Item)
        {

            column(No_; "No.") { }
            column(Description; Description) { }


            dataitem(MovProducto; "Item Ledger Entry")
            {
                DataItemTableView = sorting ("Entry no.");
                DataItemLinkReference = Productos;
                DataItemLink = "item no." = field ("No.");

                column(Document_Date; "Document Date") { }
                column(Location_Code; "Location Code") { }
                column(Quantity; Quantity) { }

                trigger OnAfterGetRecord()
                begin
                    if PrintToExcel then
                        MakeExcelDataBody();
                end;
            }

            trigger OnPreDataItem()
            begin
                MakeExcelDataHeader();
            end;
        }
    }

    procedure MakeExcelInfo()
    begin

    end;

    procedure MakeExcelDataHeader()
    begin
        ExcelBuffer.AddColumn(Productos.FieldCaption("No."), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(Productos.FieldCaption(Description), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);

        ExcelBuffer.AddColumn(MovProducto.FieldCaption("Document Date"), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn(MovProducto.FieldCaption("Location Code"), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(MovProducto.FieldCaption(Quantity), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Date);
    end;

    procedure MakeExcelDataBody()
    begin
        ExcelBuffer.AddColumn(Productos."No.", false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(Productos.Description, false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);

        ExcelBuffer.AddColumn(MovProducto."Document Date", false, '', true, false, true, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn(MovProducto."Location Code", false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(MovProducto.Quantity, false, '', true, false, true, '', ExcelBuffer."Cell Type"::Number);
    end;

    procedure CreateExcelBook()
    begin

    end;

    trigger OnInitReport()
    begin
        PrintToExcel := True;
    end;

    trigger OnPreReport()
    begin
        ExcelBuffer.DeleteAll();
    end;

    trigger OnPostReport()
    begin
        if PrintToExcel then
            CreateExcelBook();
    end;


    var
        ExcelBuffer: record "Excel Buffer";
        lItem: Record Item;
        PrintToExcel: Boolean;

}


