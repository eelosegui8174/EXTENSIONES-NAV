tableextension 50400 CamposNuevos extends Customer
{
    fields
    {
        field(50000; "Codigo taller"; Code[20])
        {
            CaptionML = ENU = 'WorkShop code', ESP = 'Código taller';
            TableRelation = Talleres;
            ValidateTableRelation = true;
        }
    }

}
pageextension 50400 CamposNuevosFicha extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Codigo taller"; "Codigo taller") { }
        }
    }


}
pageextension 50401 CamposNuevosLista extends "Customer list"
{
    layout
    {
        addafter(Name)
        {
            field("Codigo taller"; "Codigo taller") { }
        }
    }


}