page 50423 "Ficha vehiculo"
{

    PageType = Card;
    SourceTable = Vehiculos;
    CaptionML = ENU = 'Vehicle card', ESP = 'Ficha vehiculo';


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Codigo Taller"; "Codigo Taller")
                {
                    ApplicationArea = All;
                }
                field(Matricula; Matricula)
                {
                    ApplicationArea = All;
                }
                field(Tipo; Tipo)
                {
                    ApplicationArea = All;
                }
            }
            group(Informacion)
            {
                field(Marca; Marca)
                {
                    ApplicationArea = All;
                }
                field("Descripcion marca"; "Descripcion marca")
                {
                    ApplicationArea = All;
                }
                field(Modelo; Modelo)
                {
                    ApplicationArea = All;
                }
                field("Descripcion modelo"; "Descripcion modelo")
                {
                    ApplicationArea = All;
                }
                field("Partes dados"; "Partes dados")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
