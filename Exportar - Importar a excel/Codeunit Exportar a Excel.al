codeunit 50310 ExportarAExcel
{

    trigger OnRun()
    begin
        Insert_Registros_Excel();
    end;

    procedure Insert_Registros_Excel()
    begin

        ExcelBuffer.DeleteAll();

        //3º rellenamos las lineas
        CLEAR(Productos);
        Productos.SETFILTER("No.", '%1..%2', '1000', '1500');
        IF Productos.FindSet() then begin



            repeat

                CLEAR(MovProducto);
                MovProducto.SetRange("Item No.", Productos."No.");
                IF MovProducto.FindSet() then begin
                    //1º Insertamos las cabeceras


                    MakeExcelDataHeader();
                    repeat
                        MakeExcelDataBody();
                    until MovProducto.Next = 0;

                    RowSeparator(2);  //Lineas a meter entre grupo de productos

                END;
            until Productos.Next = 0;

            //2º creamos el excel
            CreateExcelBook();

        end;
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

        MakeExcelNewRow();

        ExcelBuffer.AddColumn(Productos."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(Productos.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);

        ExcelBuffer.AddColumn(MovProducto."Document Date", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.AddColumn(MovProducto."Location Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn(MovProducto.Quantity, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);

        ExcelBuffer.ad


    end;

    procedure MakeExcelNewRow()
    begin
        ExcelBuffer.NewRow();
    end;


    procedure RowSeparator(lines: integer)
    var
        Bucle: INteger;
    begin
        for Bucle := 1 to lines do begin
            ExcelBuffer.NewRow();
        END;
    end;

    procedure CreateExcelBook()
    begin
        ExcelBuffer.CreateBookAndOpenExcel('', 'Book', '', '', UserId);
    end;



    var
        ExcelBuffer: record "Excel Buffer";
        Productos: Record Item;
        MovProducto: Record "Item Ledger Entry";

}