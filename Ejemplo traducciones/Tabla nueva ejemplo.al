table 50130 Ejemplo_Tradcutor
{
    caption = 'Traduction example';

    fields
    {
        field(1; Code; code[20])
        {
            Caption = 'Code';

        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
