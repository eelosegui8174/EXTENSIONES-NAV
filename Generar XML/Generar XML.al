codeunit 50319 Generar_XML_1
{
    var
        TempXMLBuffer: Record "XML Buffer";

    trigger OnRun()
    begin
        ExportToXML();
    end;

    procedure ExportToXML()
    var
        lProductos: Record Item;
        lMovProducto: Record "Item Ledger Entry";
        FileName: Text;
        Path: Text;
        TempPathFile: Text;
        FileMgt: Codeunit "File Management";
    Begin

        CLEAR(lProductos);
        lProductos.SetRange("No.", '1000', '115');
        IF lProductos.findset then begin


            Path := FileMgt.SaveFileDialog('Save file', 'Customer', '');
            FileName := FileMgt.GetFileName(Path);
            TempPathFile := TemporaryPath + '\' + FileName;
            if Exists(TemporaryPath) then
                erase(TempPathFile);

            TempXMLBuffer.AddGroupElement(lMovProducto.TableCaption);
            TempXMLBuffer.AddAttribute('Comp :', CompanyName);

            TempXMLBuffer.AddGroupElement(lProductos.TableCaption);
            TempXMLBuffer.AddAttribute(lProductos.FieldCaption("No."), lProductos."No.");
            TempXMLBuffer.AddAttribute(lProductos.FieldCaption(Description), lProductos.Description);

            CLEAR(lMovProducto);
            lMovProducto.SETRANGE("Item No.", lProductos."No.");
            if lMovProducto.findset then begin
                REPEAT
                    TempXMLBuffer.AddElement(lMovProducto.FieldCaption("Posting Date"), FORMAT(lMovProducto."Posting Date"));
                until lMovProducto.next = 0;
                TempXMLBuffer.GetParent();
            end;


        end;

        TempXMLBuffer.save(FileName);

        FileMgt.DownloadToFile(TempPathFile, Path);
    End;

    //http://dynamicslancer.blogspot.com/2017/01/how-to-create-and-save-file-on-local.html

    procedure Exportar_Con_Codeunit_Export()
    var
        ExportDom: Codeunit "XML DOM Management";
    begin
    end;

    procedure Dame_Fichero(var FileName: Text)
    var
        FileMgt: Codeunit "File Management";
    begin
        FileName := FileMgt.OpenFileDialog('Select Path:', '', 'CSV files (*.csv)|*.csv|All files (*.*)|*.*')

    end;
}