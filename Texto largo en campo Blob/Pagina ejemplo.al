pageextension 50321 Texto_largo extends "Item Card"
{

    layout
    {
        addlast(Item)
        {
            group(CampoLargo)
            {
                field(BigText; TextoGrande)
                {
                    CaptionML = ENU = 'Big Text', ESP = 'Texto grande';
                    MultiLine = true;
                    trigger OnValidate()
                    begin
                        CLEAR(BigText);
                        BigText.CreateOutStream(OStream);
                        streamWriter := streamWriter.StreamWriter(OStream, Encoding.UTF8);
                        streamWriter.WriteLine(TextoGrande);
                        streamWriter.Close();
                        Modify();

                    end;
                }
            }
        }


    }
    trigger OnAfterGetRecord()
    begin
        CalcFields(BigText);
        BigText.CreateInStream(Istream);
        streamReader := streamReader.StreamReader(Istream, True);
        Clear(TextoGrande);
        TextoGrande.AddText(streamReader.ReadToEnd());

    end;

    var
        Char1: Char;
        char2: Char;
        OStream: OutStream;
        Istream: InStream;
        streamWriter: DotNet StreamWriter;  //En app.json poner  "target": "Internal" guardar y volver a abrir proyecto para que lo coja
        streamReader: DotNet StreamReader;
        Encoding: dotnet Encoding;
        TextoGrande: BigText;


}