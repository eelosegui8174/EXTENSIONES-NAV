codeunit 50100 colegio
{
    //Funcion que devuelve  un texto
    procedure Dame_Nombre(): Text[50]
    //declaramos variables locales a la función
    var
    Alumnos : Record Alumnos;
    begin
        Clear(Alumnos); 
        Alumnos.SetCurrentKey(Edad,Nombre);       
        Alumnos.Ascending(true);
        if Alumnos.FindLast then 
          exit(Alumnos.Nombre);  
    end;

    procedure Da_Mensaje()
    Var 
    Texto : TextConst ENU='School', ESP='Colegio';     
    begin          
         Message(Texto);
    end;         
     
    procedure Dame_Edad(DNI:Text):Integer
    var
    Alumno : Record Alumnos;
    begin
        CLEAR(Alumno);
        Alumno.get(DNI);
        exit(Alumno.Edad);
    end;
}