table 50102 Alumnos
{
    CaptionML = ENU = 'Students', ESP = 'Alumnos';

    fields
    {
        field(1; DNI; Code[30])
        {

            NotBlank = true;
        }
        field(5; Nivel; Option)
        {
            OptionMembers = Principiante,Medio,Avanzado;
            CaptionML = ENU = 'Beginner,Medium,Advance', ESP = 'Principiante,Medio,Avanzado';
        }

        field(10; Nombre; Text[50]) { }
        field(20; Apellido; Text[50]) { }
        field(30; Direccion1; Text[50]) { }
        field(40; Direccion2; Text[50]) { }
        field(50; CP; code[20])
        {
            TableRelation = "Post Code";
            trigger OnValidate()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.ValidatePostCode(Poblacion, CP, Pais, CodPais, false);
            end;


        }
        field(60; Poblacion; Text[50]) { }
        field(65; Pais; text[50])
        {
            CaptionML = ENU = 'County', ESP = 'País';
        }
        field(66; CodPais; code[10])
        {
            CaptionML = ENU = 'County code', ESP = 'Cód. País';
        }
        field(70; Edad; Integer)
        {
            CaptionML = ENU = 'Age', ESP = 'Edad';
            NotBlank = true;

        }
        field(100; Clase; Code[20]) { }
    }
    keys
    {
        //Clave principal
        key(PK; DNI)
        {
            Clustered = true;
        }

        //resto de claves
        Key(PK1; Edad)
        { }
        Key(PK2; Poblacion, Edad)
        { }
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