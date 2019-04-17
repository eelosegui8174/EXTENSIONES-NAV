
//https://community.dynamics.com/nav/b/dynamicsnavcloudfronts/archive/2017/07/23/exporting-record-details-to-excel-using-excel-buffer-in-microsoft-dynamics-nav-2017
report 50308 Export_Item_To_Excel
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
                AddSheet();
            end;
        }
    }


    procedure MakeExcelInfo()
    begin

    end;


    procedure AddSheet()
    begin
        ExcelBuffer.SelectOrAddSheet('Sheet name');
    end;

    procedure MakeExcelDataHeader()
    begin

        ExcelBuffer.AddColumn(Productos.FieldCaption("No."), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(Productos.FieldCaption(Description), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(MovProducto.FieldCaption("Document Date"), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(MovProducto.FieldCaption("Location Code"), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(MovProducto.FieldCaption(Quantity), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
    end;

    procedure MakeExcelDataBody()
    begin
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn(Productos."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(Productos.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);

        ExcelBuffer.AddColumn(MovProducto."Document Date", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn(MovProducto."Location Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(MovProducto.Quantity, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);

        ExcelBuffer.fo

    end;

    procedure CreateExcelBook()
    begin
        ExcelBuffer.CreateBookAndOpenExcel('', 'Book', '', '', UserId);
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


