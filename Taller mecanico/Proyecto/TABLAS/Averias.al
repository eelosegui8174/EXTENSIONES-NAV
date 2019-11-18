table 50401 Averias
{
    Caption = 'Averias';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(50000; Codigo; Code[20])
        {
            Caption = 'Codigo';
            DataClassification = ToBeClassified;
        }
        field(50001; "Descripción"; Text)
        {
            Caption = 'Descripción';
            DataClassification = ToBeClassified;
        }
        field(50010; Acciones; Text)
        {
            Caption = 'Acciones';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Codigo)
        {
            Clustered = true;
        }
    }
    
}
