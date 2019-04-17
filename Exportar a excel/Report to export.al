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
            }
        }
    }

    procedure MakeExcelInfo()
    begin

    end;

    procedure MakeExcelDataHeader()
    begin

    end;

    procedure MakeExcelDataBody()
    begin

    end;

    procedure CreateExcelBook()
    begin

    end;


    var
        ExcelBuffer: record "Excel Buffer";
        lItem: Record Item;
        PrintExcel: Boolean;

}


