tableextension 50401 EmpCamposNuevos extends Employee
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
pageextension 50403 EmpCamposNuevosFicha extends "Employee Card"
{
    layout
    {
        addafter(Name)
        {
            field("Codigo taller"; "Codigo taller") { }
        }
    }


}
pageextension 50404 EmpCamposNuevosLista extends "Employee list"
{
    layout
    {
        addafter(Name)
        {
            field("Codigo taller"; "Codigo taller") { }
        }
    }


}