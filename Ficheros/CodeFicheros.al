codeunit 50302 GestionFicheros
{
    trigger OnRun()
    begin

        LeerFichero();

    end;

    //**************************************************************
    //LECTURAS FICHERO txt
    //**************************************************************

    procedure SeleccionFichero(var Ruta: Text);
    begin
        Ruta := FileManagement.OpenFileDialog(Seleccion, '', 'TXT');
    end;

    procedure LeerFichero()
    var
        Ruta: Text;
        Fichero: File;
        Stream: InStream;
        Buffer: Text;

    begin

        SeleccionFichero(Ruta);

        //Abrimos y leemos el fichero


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