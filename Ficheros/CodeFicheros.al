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