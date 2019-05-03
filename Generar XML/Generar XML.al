codeunit 50319 Generar_XML
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

    Begin

        TempXMLBuffer.AddGroupElement(lMovProducto.TableCaption);
        TempXMLBuffer.AddAttribute('Comp :', CompanyName);

        CLEAR(lProductos);
        lProductos.SetRange("No.", '1000', '115');
        IF lProductos.findset then begin

            TempXMLBuffer.AddGroupElement(lProductos.TableCaption);
            TempXMLBuffer.AddAttribute(lProductos.FieldCaption("No."), lProductos."No.");
            TempXMLBuffer.AddAttribute(lProductos.FieldCaption(Description), lProductos.Description);

            CLEAR(lMovProducto);
            lMovProducto.SETRANGE("Item No.", lProductos."No.");
            if lMovProducto.findset then begin
                TempXMLBuffer.AddElement(lMovProducto.FieldCaption("Posting Date"), FORMAT(lMovProducto."Posting Date"));
                TempXMLBuffer.GetParent();
            end;


        end;

        TempXMLBuffer.save('c:\demo.xml');


    End;
}