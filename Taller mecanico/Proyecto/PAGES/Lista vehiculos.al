page 50403 "Lista vehiculos"
{

    PageType = List;
    SourceTable = Vehiculos;
    Caption = 'Lista vehiculos';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Codigo Taller"; "Codigo Taller")
                {
                    ApplicationArea = All;
                }
                field(Matricula; Matricula)
                {
                    ApplicationArea = All;
                }
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

                field(Tipo; Tipo)
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
