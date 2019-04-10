pageextension 50304 LoadPicture extends "Item Card" //MyTargetPageId
{
    layout
    {
        addafter("No.")
        {
            //Para probar a meter aqui la ruta de la imagen a cargar https://......
            field(RutaImagen; RutaImagen) { }

        }
    }
    //https://amolsalvi.blog/2018/12/07/how-to-upload-file-from-url-using-extension-in-business-central/
    actions
    {

        addafter(Item)
        {
            group(Imagnes)
            {
                CaptionML = ENU = 'Load Image', ESP = 'Cargar imagen';
                action(LoadPicture)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Picture;
                    Caption = 'Cargar imagen desde URL';

                    trigger OnAction()
                    begin

                        ImportarDesdeURL;

                    end;
                }
                action(LoadPictureDirectory)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Picture;
                    Caption = 'Cargar imagen desde ubicación';

                    trigger OnAction()
                    var
                        Client: HttpClient;
                        Response: HttpResponseMessage;
                        lStr: InStream;

                    begin

                        ImportarDesdeFichero;

                    end;
                }
            }
        }
    }

    var
        RutaImagen: Text;

    procedure DameRuta() Ruta: Text
    begin
        Ruta := 'https://home.ripley.cl/store/Attachment/WOP/D192/2000365790101/2000365790101_2.jpg';

    end;

    procedure ImportarDesdeUrl()
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        lStr: InStream;
        T: Text;
    begin

        //Client.Get(DameRuta(), Response);
        Client.Get(RutaImagen, Response);
        Response.Content().ReadAs(lStr);
        Picture.ImportStream(lStr, 'Imagen desde URL');
        Modify();
        lStr.ReadText(t);
        message(t);
    end;


    //IMPORTANTE: Para que funcione Uploadfile, ImportFile ... hay que poner en el fichero Json   "target": "Internal"
    procedure ImportarDesdeFichero()
    var
        FileManagement: Codeunit "File Management";
        FileName: Text;
        ClientFileName: Text;
        SelectPictureTxt: Text;
        Sobreescribir: Label 'Se sustituirá la imagen existente. ¿Quiere continuar?';
    begin
        TESTFIELD("No.");
        //TESTFIELD(Description);

        IF Picture.COUNT > 0 THEN
            IF NOT CONFIRM(SobreEscribir) THEN
                ERROR('');

        ClientFileName := '';
        FileName := FileManagement.UploadFile(SelectPictureTxt, ClientFileName);
        IF FileName = '' THEN
            ERROR('');

        CLEAR(Picture);
        Picture.IMPORTFILE(FileName, ClientFileName);
        IF NOT INSERT(TRUE) THEN
            MODIFY(TRUE);

        IF FileManagement.DeleteServerFile(FileName) THEN;
    END;
}