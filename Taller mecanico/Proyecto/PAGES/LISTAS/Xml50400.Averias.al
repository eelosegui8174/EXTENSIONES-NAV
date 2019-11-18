xmlport 50400 Averias
{
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Averias; Averias)
            {
                fieldelement(Descripcin; Averias."Descripción")
                {
                }
                fieldelement(Codigo; Averias.Codigo)
                {
                }
                fieldelement(Acciones; Averias.Acciones)
                {
                }
                fieldelement(SystemId; Averias.SystemId)
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
