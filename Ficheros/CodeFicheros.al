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
        Fichero: File;
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

    procedure BorrarFichero(Ruta: Text)
    Begin

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