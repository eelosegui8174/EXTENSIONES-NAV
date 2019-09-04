page 50422 "Ficha cliente"
{

    PageType = Card;
    SourceTable = Clientes;
    CaptionML = ENU = 'Customer card', ESP = 'Ficha clinete';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Codigo Cliente"; "Codigo Cliente")
                {
                    ApplicationArea = All;
                }
                field("Codigo Taller"; "Codigo Taller")
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
                field(DNI; DNI)
                {
                    ApplicationArea = All;
                }
                field(Nombre; Nombre)
                {
                    ApplicationArea = All;
                }
                field(Telefono; Telefono)
                {
                    ApplicationArea = All;
                }
            }
            group(Acciones)
            {
            }
            group(Navegar)
            {
            }
        }
    }

}
