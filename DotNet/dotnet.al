dotnet
{
    assembly("Microsoft.Dynamics.Nav.OpenXml")
    {
        Version='13.0.0.0';
        Culture='neutral';
        PublicKeyToken='31bf3856ad364e35';

        type("Microsoft.Dynamics.Nav.OpenXml.Spreadsheet.WorkbookWriter";"WorkbookWriter"){}
        type("Microsoft.Dynamics.Nav.OpenXml.Spreadsheet.WorkbookReader";"WorkbookReader"){}
        type("Microsoft.Dynamics.Nav.OpenXml.Spreadsheet.WorksheetWriter";"WorksheetWriter"){}
        type("Microsoft.Dynamics.Nav.OpenXml.Spreadsheet.WorksheetReader";"WorksheetReader"){}
        type("Microsoft.Dynamics.Nav.OpenXml.Spreadsheet.CellDecorator";"CellDecorator"){}
        type("Microsoft.Dynamics.Nav.OpenXml.Spreadsheet.CellData";"CellData"){}
    }

    assembly("mscorlib")
    {
        Version='4.0.0.0';
        Culture='neutral';
        PublicKeyToken='b77a5c561934e089';

        type("System.Text.StringBuilder";"StringBuilder"){}
        type("System.IO.FileMode";"FileMode"){}
        type("System.Text.Encoding";"Encoding"){}
        type("System.Collections.IEnumerator";"IEnumerator"){}
        type("System.Collections.ArrayList";"ArrayList"){}
        type("System.IO.Path";"Path"){}
        type("System.DateTime";"DateTime"){}
        type("System.DateTimeKind";"DateTimeKind"){}
    }

    assembly("DocumentFormat.OpenXml")
    {
        Version='2.5.5631.0';
        Culture='neutral';
        PublicKeyToken='31bf3856ad364e35';

        type("DocumentFormat.OpenXml.Spreadsheet.OrientationValues";"OrientationValues"){}
        type("DocumentFormat.OpenXml.Packaging.VmlDrawingPart";"VmlDrawingPart"){}
    }

    assembly("System.Xml")
    {
        Version='4.0.0.0';
        Culture='neutral';
        PublicKeyToken='b77a5c561934e089';

        type("System.Xml.XmlTextWriter";"XmlTextWriter"){}
    }

}
