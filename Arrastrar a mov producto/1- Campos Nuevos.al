tableextension 50200 CamposCliente extends Customer
{
    fields
    {
        field(50020; Nick; Text[30])
        {
            CaptionML = ENU = 'Nickl', ESP = 'Nick';
        }
        field(50021; Color; Option)
        {
            CaptionML = ENU = 'Favorite color', ESP = 'Color favorito';
            OptionMembers = "",Rojo,Amarillo,Azul;
            OptionCaptionML = ENU = ' ,Red,Yellow,Blue', ESP = ' ,Rojo,Amarillo,Azul';
        }
        field(50022; Aficion; Text[50])
        { }
    }

}

tableextension 50201 CamposMovProducto extends "Item Ledger Entry"
{
    fields
    {
        field(50020; Nick; Text[30])
        {
            CaptionML = ENU = 'Nickl', ESP = 'Nick';
            Editable = false;
        }
        field(50021; Color; Option)
        {
            CaptionML = ENU = 'Favorite color', ESP = 'Color favorito';
            OptionMembers = "",Rojo,Amarillo,Azul;
            OptionCaptionML = ENU = ' ,Red,Yellow,Blue', ESP = ' ,Rojo,Amarillo,Azul';
            Editable = false;
        }
    }

}

