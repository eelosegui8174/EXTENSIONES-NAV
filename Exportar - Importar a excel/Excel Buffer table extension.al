tableextension 50308 Campos_Formato_Excel_Buffer extends "Excel Buffer"
{

    fields
    {
        field(50000; "Custom Font Name"; Text[100])
        {
            CaptionML = ENU = ' "Custom Font Name', ESP = 'Fuente persolanlizada'; //si no usamos  fichero de traducciones
            Editable = True;
        }
        field(50001; "Custom Font Size"; Integer)
        {
            CaptionML = ENU = 'Custom Font Size', ESP = 'Tamaño fuente personalizada'; //si no usamos  fichero de traducciones
            Editable = True;
        }
        field(50002; "Custom Font Color"; Integer)
        {
            CaptionML = ENU = ' "Custom Font Color', ESP = 'Color personalizado'; //si no usamos  fichero de traducciones
            Editable = True;
        }
        field(50003; "Custom Background color"; Integer)
        {
            CaptionML = ENU = 'Custom Background color', ESP = 'Color fondo personalizado'; //si no usamos  fichero de traducciones
            Editable = True;
        }
        field(50004; "Using custom decorator"; Boolean)
        {
            CaptionML = ENU = 'Using custom decorator', ESP = 'Texto'; //si no usamos  fichero de traducciones
            Editable = True;
        }
        field(50005; Custom_Font_Name; Text[100])
        {
            CaptionML = ENU = 'Text', ESP = 'Texto'; //si no usamos  fichero de traducciones
            Editable = True;
        }
    }

    procedure AddColumnWithFont(Value: Variant; IsFormula: Boolean; CommentText: Text; IsBold: Boolean; IsItalics: Boolean; IsUnderline: Boolean; NumFormat: Text[30]; CellType: Option)
    begin
        AddColumnToBufferWithFont(Rec, Value, IsFormula, CommentText, IsBold, IsItalics, IsUnderline, NumFormat, CellType);

    end;

    procedure AddColumnToBufferWithFont(VAR ExcelBuffer: Record "Excel Buffer"; Value: Variant; IsFormula: Boolean; CommentText: Text; IsBold: Boolean; IsItalics: Boolean; IsUnderline: Boolean; NumFormat: Text[30]; CellType: Option)
    var
        CurrentRow: Integer;
        CurrentCol: Integer;
    Begin
        IF CurrentRow < 1 THEN
            NewRow;

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
        ExcelBuffer."Cell Type" := CellType;
        ExcelBuffer.INSERT;
    END;

    procedure GetCellDecoratorWithFont(IsBold: Boolean; IsItalic: Boolean; IsUnderlined: Boolean; IsDoubleUnderlined: Boolean; VAR Decorator: DotNet "Microsoft.Dynamics.Nav.OpenXml.Spreadsheet.CellDecorator")
    begin
         
        IF IsBold AND IsItalic THEN BEGIN
            IF IsDoubleUnderlined THEN BEGIN
                Decorator := XlWrkShtWriter.DefaultBoldItalicDoubleUnderlinedCellDecorator;
                EXIT;
            END;
            IF IsUnderlined THEN BEGIN
                Decorator := XlWrkShtWriter.DefaultBoldItalicUnderlinedCellDecorator;
                EXIT;
            END;
        END;

        IF IsBold AND IsItalic THEN BEGIN
            Decorator := XlWrkShtWriter.DefaultBoldItalicCellDecorator;
            EXIT;
        END;

        IF IsBold THEN BEGIN
            IF IsDoubleUnderlined THEN BEGIN
                Decorator := XlWrkShtWriter.DefaultBoldDoubleUnderlinedCellDecorator;
                EXIT;
            END;
            IF IsUnderlined THEN BEGIN
                Decorator := XlWrkShtWriter.DefaultBoldUnderlinedCellDecorator;
                EXIT;
            END;
        END;

        IF IsBold THEN BEGIN
            Decorator := XlWrkShtWriter.DefaultBoldCellDecorator;
            EXIT;
        END;

        IF IsItalic THEN BEGIN
            IF IsDoubleUnderlined THEN BEGIN
                Decorator := XlWrkShtWriter.DefaultItalicDoubleUnderlinedCellDecorator;
                EXIT;
            END;
            IF IsUnderlined THEN BEGIN
                Decorator := XlWrkShtWriter.DefaultItalicUnderlinedCellDecorator;
                EXIT;
            END;
        END;

        IF IsItalic THEN BEGIN
            Decorator := XlWrkShtWriter.DefaultItalicCellDecorator;
            EXIT;
        END;

        IF IsDoubleUnderlined THEN
            Decorator := XlWrkShtWriter.DefaultDoubleUnderlinedCellDecorator
        ELSE BEGIN
            IF IsUnderlined THEN
                Decorator := XlWrkShtWriter.DefaultUnderlinedCellDecorator
            ELSE
                Decorator := XlWrkShtWriter.DefaultCellDecorator;
        END;
    end;
}