codeunit 50320 ExportarAExcelFont
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

        // ExcelBuffer.AddColumn(Productos.FieldCaption("No."), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn(Productos.FieldCaption(Description), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn(MovProducto.FieldCaption("Document Date"), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn(MovProducto.FieldCaption("Location Code"), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.AddColumn(MovProducto.FieldCaption(Quantity), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text);

        AddColumnFont(Productos.FieldCaption("No."), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text, '', 10, 0, 0);
        AddColumnFont(Productos.FieldCaption(Description), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text, '', 10, 0, 0);
        AddColumnFont(MovProducto.FieldCaption("Document Date"), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text, '', 10, 0, 0);
        AddColumnFont(MovProducto.FieldCaption("Location Code"), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text, '', 10, 0, 0);
        AddColumnFont(MovProducto.FieldCaption(Quantity), false, '', true, false, true, '', ExcelBuffer."Cell Type"::Text, '', 10, 0, 0);
    end;

    procedure MakeExcelDataBody()
    begin

        MakeExcelNewRow();

        AddColumnFont(Productos."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text, '', 10, 0, 0);
        AddColumnFont(Productos.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text, '', 10, 0, 0);
        AddColumnFont(MovProducto."Document Date", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date, '', 10, 0, 0);
        AddColumnFont(MovProducto."Location Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text, '', 10, 0, 0);
        AddColumnFont(MovProducto.Quantity, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number, '', 10, 0, 0);



    end;

    procedure MakeExcelNewRow()
    begin
        //ExcelBuffer.NewRow();
        CurrentRow := CurrentRow + 1;
    end;


    procedure RowSeparator(lines: integer)
    var
        Bucle: INteger;
    begin
        for Bucle := 1 to lines do begin
            //ExcelBuffer.NewRow();
            CurrentCol := 0;
            CurrentRow := CurrentRow + 1;
        END;
    end;

    procedure CreateExcelBook()
    begin
        ExcelBuffer.CreateBookAndOpenExcel('', 'Book', '', '', UserId);
    end;

    procedure AddColumnFont(Value: Variant; IsFormula: Boolean; CommentText: Text; IsBold: Boolean; IsItalics: Boolean; IsUnderline: Boolean; NumFormat: Text[30]; CellType: Option; FontName: Text[100]; FontSize: integer; FontColor: Integer; BackgroundColor: Integer);
    var
        ExcelBuffer: Record "Excel Buffer";

    BEGIN
        if CurrentRow < 1 then
            CurrentRow := CurrentRow + 1;



        CurrentCol := CurrentCol + 1;

        ExcelBuffer.INIT;
        ExcelBuffer.VALIDATE("Row No.", CurrentRow);
        ExcelBuffer.VALIDATE("Column No.", CurrentCol);
        IF IsFormula THEN
            ExcelBuffer.SetFormula(FORMAT(Value))
        ELSE
            ExcelBuffer."Cell Value as Text" := FORMAT(Value);
        ExcelBuffer.Comment := COPYSTR(CommentText, 1, MAXSTRLEN(ExcelBuffer.Comment));
        ExcelBuffer.Bold := IsBold;
        ExcelBuffer.Italic := IsItalics;
        ExcelBuffer.Underline := IsUnderline;
        ExcelBuffer.NumberFormat := NumFormat;
        ExcelBuffer."Cell Type" := ExcelBuffer."Cell Type"::Text;
        //Nuevos campos para darle formato
        ExcelBuffer."Custom font Name" := FontName;
        ExcelBuffer."Custom font Size" := FontSize;
        ExcelBuffer."Custom font Color" := FontColor;
        ExcelBuffer."Custom Background Color" := BackgroundColor;
        ExcelBuffer."Using Custom Decorator" := True;
        ExcelBuffer.INSERT;

    END;

    procedure GetCellDecoratorFont(FontName: Text[100]; FontSize: integer; FontColor: Integer; BackgroundColor: Integer)
    var
        Fonts: dotnet CellDecorator;
        CustomFont: dotnet CellDecorator;
        Decorator: DotNet CellDecorator;
        XlWrkBkWriter: dotnet WorkbookWriter;
    begin
        // CustomFont := Decorator.Font;

    END;



    var
        ExcelBuffer: record "Excel Buffer";
        Productos: Record Item;
        MovProducto: Record "Item Ledger Entry";

        CurrentRow: Integer;
        CurrentCol: Integer;

}