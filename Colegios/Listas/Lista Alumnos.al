page 50102 "Lista Alumnos"
{

    PageType = List;
    SourceTable = "Alumnos";
    Caption = 'Lista Alumnos';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("DNI"; "DNI")
                {
                    ApplicationArea = All;
                }
                field("Nivel"; "Nivel")
                {
                    ApplicationArea = All;
                }
                field("Nombre"; "Nombre")
                {
                    ApplicationArea = All;
                }
                field("Apellido"; "Apellido")
                {
                    ApplicationArea = All;
                }
                field("Direccion1"; "Direccion1")
                {
                    ApplicationArea = All;
                }
                field("Direccion2"; "Direccion2")
                {
                    ApplicationArea = All;
                }
                field("CP"; "CP")
                {
                    ApplicationArea = All;
                }
                field("Poblacion"; "Poblacion")
                {
                    ApplicationArea = All;
                }
                field("Edad"; "Edad")
                {
                    ApplicationArea = All;
                }
                field("Clase"; "Clase")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}
