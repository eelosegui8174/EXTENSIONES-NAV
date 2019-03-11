page 50100 "Pagina Colegio"
{

    PageType = Card;
    SourceTable = "Colegio";
    Caption = 'Pagina Colegio';


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Nombre"; "Nombre")
                {
                    ApplicationArea = All;

                }


            }
            group(Direccion)
            {
                field("Direccion1"; "Direccion1")
                {
                    ApplicationArea = All;
                }
                field("Direccion2"; "Direccion2")
                {
                    ApplicationArea = All;
                }
                field("Codigo postal"; "Codigo postal")
                {
                    ApplicationArea = All;
                }
                field("Poblacion"; "Poblacion")
                {
                    ApplicationArea = All;
                }
                field("Pais"; "Pais")
                {
                    ApplicationArea = All;
                }
            }
            group(Imagen)
            {
                field(Image; Imagen)
                { }
            }
            group(alumnos)
            {
                field(TotalalumnosPrincipiantes; TotalalumnosPrincipiantes) { }
                field(TotalalumnosMedios; TotalalumnosMedios) { }
                field(TotalalumnosAvanzados; TotalalumnosAvanzados) { }
                field(MasJoven; MasJoven)
                {
                    Editable = false;
                }
                field(NombreJoven; NombreJoven)
                {

                }
                field(AlumnoMayor; AlumnoMayor) //variable
                {
                    CaptionML = ESP = 'Alumno mayor';
                }

            }
        }
    }

    actions
    {

        area(Navigation)
        {

            action(Mostraralumnos)
            {

                CaptionMl = ENU = 'Students', ESP = 'Alumnos';
                Image = User;
                Promoted = true;
                PromotedIsBig = True;
                trigger OnAction();
                var
                    Lista_Alumnos: Page "Lista Alumnos";

                begin
                    Lista_Alumnos.Run;
                end;
            }
            action(MostrarAsignaturas)
            {
                CaptionML = ENU = 'Sow subjects', ESP = 'Mostrar Asignaturas';
                Image = Relatives;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction();
                var
                    ListaAsignaturas: page "Lista asignaturas";
                begin
                    ListaAsignaturas.RunModal;
                end;
            }
            action(Mensaje)
            {
                trigger OnAction();
                begin
                    Codunit_Alumnos.Da_Mensaje();
                end;
            }
            action(Error)
            { }
            action(COnfirm)
            { }
            action(Dialogo)
            { }


        }
    }
    trigger OnAfterGetRecord()
    begin
        AlumnoMayor := Codunit_Alumnos.Dame_Nombre();

    end;

    //VARIABLES
    var
        ListaAlumnos: Page 50102;
        AlumnoMayor: Text[50];
        Codunit_Alumnos: Codeunit colegio;
}
