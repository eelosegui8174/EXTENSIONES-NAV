pageextension 50304 LoadPicture extends "Item Card" //MyTargetPageId
{


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
    procedure DameRuta() Ruta: Text
    var

    begin
        Ruta := 'https://www.tonibike.es/4171-thickbox_default/bicicleta--conor-wrc-comp-disc-blancorojo-.jpg';
    end;
}