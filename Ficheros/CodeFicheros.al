
//Las variables DOTNET SE DECLARAN FUERA
//MUY IMPORTANTE en app.json poner "target": "Internal"

dotnet
{
    assembly(mscorlib)
    {
        type(System.IO.StreamReader; DotnetStream) { }
        type(System.Text.Encoding; DotNetTextEncoding) { }
    }
}

codeunit 50302 GestionFicheros
{

    //**************************************************************
    //LECTURAS FICHERO txt
    //**************************************************************

    procedure SeleccionFichero(var Ruta: Text);
    begin
        Ruta := FileManagement.OpenFileDialog(Seleccion, '', 'TXT');
    end;

    procedure LeerFicheroTXT()
    var
        Ruta: Text;
        Stream: InStream;
        Buffer: Text;
        TempBlod: record TempBlob;
        lInstream: InStream;
    begin

        SeleccionFichero(Ruta);

        //Abrimos y leemos el fichero
        TempBlod.Blob.Import(Ruta);
        TempBlod.Blob.CreateInStream(lInstream);
        while not lInstream.EOS do begin
            lInstream.ReadText(Buffer);
            Message(Buffer);
        end;

    end;

    procedure LeerFicheroConDotNet()
    var
        Ruta: Text;
        Buffer: Text;
        lInstream: InStream;
        DotNetStream: DotNet DotnetStream; //Variable declarada arriba de tipo dotnet  
        DotNetTextEncoding: DotNet DotNetTextEncoding;  //Variable declarada arriba de tipo dotnet  
        lFile: File;
        Seguir: Boolean;
        Opc: Integer;

    begin

        opc := StrMenu('&Todo,&Por línea', 3);




        SeleccionFichero(Ruta);
        lFile.Open(Ruta);
        lFile.CreateInStream(lInstream);

        DotNetStream := DotNetStream.StreamReader(lInstream, DotNetTextEncoding.UTF8);

        IF opc = 1 then begin

            Buffer := DotNetStream.ReadToEnd();
            DotNetStream.Close();
            lFile.Close();

            message(Buffer);
        END;

        If opc = 2 then begin
            Seguir := true;

            while Seguir do begin
                Buffer := DotNetStream.ReadLine();
                IF Buffer = '' then
                    Seguir := false
                else
                    Message(buffer);
            end;
        end;

    end;


    //IMPORTANTE: Para que funcione DeleteServerFile ... hay que poner en el fichero Json   "target": "Internal"
    procedure BorrarFichero(Ruta: Text)
    var
        Correcto: Boolean;
    Begin
        Correcto := FileManagement.DeleteServerFile(Ruta);
    End;



    //**************************************************************
    //CREAR FICHEROS
    //**************************************************************
    procedure CrearFichero(Nombre: Text)
    begin

    end;

    procedure EscribirEnFichero(Ruta: Text)
    begin

    end;





    var
        FileManagement: Codeunit "File Management";
        Seleccion: TextConst ENU = 'Select file', ESP = 'Selecciona fichero';
}