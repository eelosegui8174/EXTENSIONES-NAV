page 50404 "Imagen Taller"
{

    PageType = CardPart;
    SourceTable = Talleres;
    CaptionML = ENU = 'WorkShop Picture', ESP = 'Imagen Taller';

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Logo; Logo)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportImage)
            {

                CaptionML = ENU = 'Import image', ESP = 'Importar Imagen'; //si no usamos  fichero de traducciones
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true; //Número de decimales que queremos que tenga (0:0) sin restricción
                Image = Import;
                trigger OnAction()
                Var

                    OverrideImageQst: TextConst ESP = 'Se sustituirá la imagen existente. ¿Quiere continuar?';
                    SelectPictureTxt: TextConst ESP = '  Seleccionar una imagen para cargar';
                    FileName: Text;
                    FileManagement: Codeunit "File Management";
                    ClientFileName: Text;

                begin
                    TESTFIELD(Codigo);


                    IF Logo.HASVALUE THEN BEGIN
                        IF NOT CONFIRM(OverrideImageQst) THEN
                            EXIT;
                    END;
                    FileName := FileManagement.UploadFile(SelectPictureTxt, ClientFileName);
                    IF FileName = '' THEN
                        EXIT;

                    CLEAR(Logo);
                    Logo.IMPORTFILE(FileName, ClientFileName);
                    IF NOT MODIFY(TRUE) THEN
                        INSERT(TRUE);

                    IF FileManagement.DeleteServerFile(FileName) THEN;
                end;
            }
            action(ExportImagen)
            {
                //Caption = 'Texto';//si  usamos  fichero de traducciones o no queremos otro idioma
                CaptionML = ENU = 'Export Image', ESP = 'Exportar Imagen'; //si no usamos  fichero de traducciones
                Promoted = true;
                PromotedCategory = Process; //New,Process,Report,Category4,Category5...Category10
                PromotedIsBig = true; //Número de decimales que queremos que tenga (0:0) sin restricción
                Image = Export;
                trigger OnAction()
                Var
                    ToFile: Text;
                    ExportPath: Text;
                    FileManagement: Codeunit "File Management";
                    DummyPictureEntity: Record "Picture Entity";
                begin
                    TESTFIELD(Codigo);


                    ToFile := DummyPictureEntity.GetDefaultMediaDescription(Rec);
                    ExportPath := TEMPORARYPATH + Codigo + FORMAT(Logo.MEDIAID);
                    Logo.EXPORTFILE(ExportPath);

                    FileManagement.ExportImage(ExportPath, ToFile);

                end;
            }
            action(DeleteImage)
            {
                //Caption = 'Texto';//si  usamos  fichero de traducciones o no queremos otro idioma
                CaptionML = ENU = 'Delete Image', ESP = 'Borrar Imagen'; //si no usamos  fichero de traducciones
                Promoted = true;
                PromotedCategory = Process; //New,Process,Report,Category4,Category5...Category10
                PromotedIsBig = true; //Número de decimales que queremos que tenga (0:0) sin restricción
                Image = Delete;
                trigger OnAction()
                Var
                    DeleteImageQst: TextConst ESP = ' ¿Está seguro de que desea eliminar la imagen?';
                begin
                    TESTFIELD(Logo);

                    IF NOT CONFIRM(DeleteImageQst) THEN
                        EXIT;

                    CLEAR(Logo);
                    MODIFY(TRUE);
                end;
            }
        }
    }

}
