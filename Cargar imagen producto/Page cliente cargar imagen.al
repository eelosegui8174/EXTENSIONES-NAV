dotnet
{
    assembly(mscorlib)
    {
        type(System.DateTime; MyDateTime) { }
    }
}
pageextension 50304 LoadPicture extends "Item Card" //MyTargetPageId
{

    actions
    {
        addafter(Item)
        {
            group(Imagnes)
            {
                CaptionML = ENU = 'Load Image', ESP = 'Cargar imagen';
                action(LoadPictureHTTP)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Picture;
                    Caption = 'Cargar imagen desde URL';

                    trigger OnAction()
                    var
                        Client: HttpClient;
                        Response: HttpResponseMessage;
                        lStr: InStream;

                    begin

                        Client.Get(DameRuta(), Response);
                        Response.Content().ReadAs(lStr);
                        Modify();

                    end;
                }
            }
        }
    }
    procedure DameRutaHttp() Ruta: Text
    var

        dialog: Dialog;

    begin
        dialog.Open('Ruta #1############################################');
        dialog.
        Ruta := 'https://www.tonibike.es/4171-thickbox_default/bicicleta--conor-wrc-comp-disc-blancorojo-.jpg';
    end;


}