table 50403 Vehiculos
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Codigo Taller"; Code[20])
        {
            CaptionML = ENU = 'Whorkshop Code', ESP = 'Código taller';
            TableRelation = Talleres;
            NotBlank = true;
        }
        field(2; Matricula; Code[20])
        {
            NotBlank = true;
        }
        field(10; Marca; code[20])
        {
            CaptionML = ENU = 'Brand', ESP = 'Marca';

        }
        field(11; "Descripcion marca"; Text[50])
        {
            CaptionML = ENU = 'Brand description', ESP = 'Descripción marca';

        }
        field(20; Modelo; code[20])
        {
            CaptionML = ENU = 'Modelo', ESP = 'Marca';

        }
        field(21; "Descripcion modelo"; text[50])
        {
            CaptionML = ENU = 'Brand description', ESP = 'Descripción modelo';

        }

        field(50025; Tipo; Option)
        {
            NotBlank = true;
            CaptionML = ENU = 'Type', ESP = 'Tipo';
            Editable = True;
            OptionMembers = Coche,Camión,Furgoneta,Moto;
            OptionCaptionML = ENU = 'Car, Truck,Van,MotorBike', ESP = 'Coche,Camión,Furgoneta,Moto';
        }
        field(30; "Partes dados"; Integer)
        { }
    }

    keys
    {
        key(PK; "Codigo Taller", Matricula)
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