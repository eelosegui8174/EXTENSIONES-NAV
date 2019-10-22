page 50420 "Ficha taller"
{

    PageType = Card;
    SourceTable = Talleres;
    CaptionML = ENU = 'Workshop card', ESP = 'Ficha taller';
    CardPageId = "Lista Talleres";
    UsageCategory = Documents;
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
                        Visible = false;
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

        area(factboxes)
        {
            part(Imagen; "Imagen Taller")
            {
                CaptionML = ENU = 'Image', ESP = 'Imagen';
                ApplicationArea = Basic, Suite;
                SubPageLink = Codigo = FIELD(Codigo);

            }
            part(Info; "FactBox Info Taller")
            {
                CaptionML = ENU = 'Info', ESP = 'Info';
                SubPageLink = Codigo = field(Codigo);
            }

        }
    }
    actions
    {

    }

}
