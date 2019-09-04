page 50420 "Ficha taller"
{

    PageType = Card;
    SourceTable = Talleres;
    CaptionML = ENU = 'Workshop card', ESP = 'Ficha taller';
    CardPageId = "Lista Talleres";

    layout
    {
        area(content)
        {
            group(gGeneral)
            {
                CaptionML = ENU = 'General', ESP = 'General';
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
                group(gLogo)
                {
                    Caption = '';
                    field(Logo; Logo)
                    {
                        ApplicationArea = All;
                    }
                }

            }
            group(gDireccion)
            {
                CaptionML = ENU = 'Direcction', ESP = 'Dirección';
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
                CaptionML = ENU = 'COmunication', ESP = 'Comunicación';
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
