page 50420 "Ficha taller"
{

    PageType = Card;
    SourceTable = Talleres;
    Caption = 'Ficha taller';

    layout
    {
        area(content)
        {
            group(gGeneral)
            {
                field(Codigo; Codigo)
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field(Nombre; Nombre)
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field(Clientes; Clientes)
                {
                    ApplicationArea = All;
                }
                field(Empleados; Empleados)
                {
                    ApplicationArea = All;
                }
                field(Logo; Logo)
                {
                    ApplicationArea = All;
                }


            }
            group(gDireccion)
            {

                field(Poblacion; Poblacion)
                {
                    ApplicationArea = All;
                }
                field(Provincia; Provincia)
                {
                    ApplicationArea = All;
                }

                field(CP; CP)
                {
                    ApplicationArea = All;
                }
                field(Direccion; Direccion)
                {
                    ApplicationArea = All;
                }
                field(Direccion2; Direccion2)
                {
                    ApplicationArea = All;
                }
            }
            group(gComunicación)
            {
                field(Telefono; Telefono)
                {
                    ApplicationArea = All;
                }
                field(Web; Web)
                {
                    ApplicationArea = All;
                }
                field(Email; Email)
                {
                    ApplicationArea = All;
                }
            }



        }
    }
    actions
    {

    }

}
