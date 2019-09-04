page 50404 "Ficha cliente"
{
    
    PageType = Card;
    SourceTable = Clientes;
    Caption = 'Ficha cliente';
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Codigo Cliente";"Codigo Cliente")
                {
                    ApplicationArea = All;
                }
                field("Codigo Taller";"Codigo Taller")
                {
                    ApplicationArea = All;
                }
                field(Apellido;Apellido)
                {
                    ApplicationArea = All;
                }
                field(Apellido2;Apellido2)
                {
                    ApplicationArea = All;
                }
                field(DNI;DNI)
                {
                    ApplicationArea = All;
                }
                field(Nombre;Nombre)
                {
                    ApplicationArea = All;
                }
                field(Telefono;Telefono)
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
