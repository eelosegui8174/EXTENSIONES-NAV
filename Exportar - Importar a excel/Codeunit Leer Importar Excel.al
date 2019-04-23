//https://community.dynamics.com/nav/b/dynamicsnavcloudfronts/archive/2017/04/17/importing-excel-file-in-microsoft-dynamics-nav-using-excel-buffer
codeunit 50311 ImportarExcel
{
    trigger OnRun()
    begin

        //Recuperamos el fichero a cargar 
        Fichero := Selecciona_Fichero();
        if Fichero <> '' then begin

            //Recuperamos la hoja de la que queremos leer si tiene mas de una
            Hoja := Selecciona_Hoja();

            //Abrimos el documento
            ExcelBuffer.LockTable();
            ExcelBuffer.OpenBook(Fichero, Hoja);
            ExcelBuffer.ReadSheet();

            //Recuperamos la ultima linea y ultima columna
            IF ExcelBuffer.FindLast() then begin
                UltimaFila := ExcelBuffer."Row No.";
                UltimaColumna := ExcelBuffer."Column No.";
            end;

            //Leemos el fichero 

            ExcelBuffer.SetRange("Row No.", 1);
            IF ExcelBuffer.findset then Begin
                Repeat
                    case excelbuffer."Column No." of
                        1:
                            Begin
                                CodigoProducto := ExcelBuffer."Cell Value as Text";
                            End;
                        2:
                            Begin
                                Descripcion := ExcelBuffer."Cell Value as Text";
                            End;
                        3:
                            Begin
                                //Cuando estemos en la ultima columna es cuando tenemos todos los campos del registro
                            End;
                        else BEGIN

                                MaxInventario := ExcelBuffer."Cell Value as Text";

                                //CODIGO
                                CLEAR(eItem);
                                eitem.Init();
                                eitem.Validate("No.", CodigoProducto);
                                eItem.Validate(Description, Descripcion);
                                if MaxInventario <> '' then
                                    EVALUATE(eitem."Maximum Inventory", MaxInventario);
                                eitem.Insert();

                            END;
                    end;

                    i += 1;
                Until ExcelBuffer.Next = 0;
            End;


            CLEAR(ExcelBuffer);
            ExcelBuffer.DELETEALL;
        END;
    end;


    local procedure Selecciona_Fichero() Filename: Text
    var
        FileManagement: Codeunit "File Management";
    begin
        Filename := FileManagement.UploadFile('Ruta de fichero excel.', '*.xlsx');
        EXIT(FileName);
    end;

    local procedure Selecciona_Hoja() Hoja: Text

    begin
        CLEAR(ExcelBuffer);
        Hoja := ExcelBuffer.SelectSheetsName(Fichero);
    end;



    var
        ExcelBuffer: record "Excel Buffer";
        FileInstream: InStream;
        Fichero: Text;
        Hoja: Text;
        ExcelCellValue: Text;
        I: Integer;
        UltimaFila: Integer;
        UltimaColumna: Integer;
        CodigoProducto: Code[20];
        Descripcion: Text;
        MaxInventario: Text;
        eItem: Record Item;



}