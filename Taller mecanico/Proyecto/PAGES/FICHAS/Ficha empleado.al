page 50421 "Ficha empleado"
{

    PageType = Card;
    SourceTable = Empleados;
    CaptionML = ENU = 'Employe card', ESP = 'Ficha empleado';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Codigo Empleado"; "Codigo Empleado")
                {
                    ApplicationArea = All;
                }
                field("Codigo Taller"; "Codigo Taller")
                {
                    ApplicationArea = All;
                }
            }
            group(Datos)
            {
                field(DNI; DNI)
                {
                    ApplicationArea = All;
                }
                field(Nombre; Nombre)
                {
                    ApplicationArea = All;
                }
                field(Apellido; Apellido)
                {
                    ApplicationArea = All;
                }
                field(Apellido2; Apellido2)
                {
                    ApplicationArea = All;
                }
                field(Telefono; Telefono)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
