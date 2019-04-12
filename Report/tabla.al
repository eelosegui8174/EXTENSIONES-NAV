table 50210 MyTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Nombre; Decimal)
        {
            CaptionML = ENU = '', ESP = '';
            Editable = True;
            // NotBlank = false; //Si no permitimos que se quede vacio
            // DecimalPlaces = 0:2;
            // MinValue = 0;
            // MaxValue = 'max' 
        }
        field(3; Nombre2; Decimal)
        {
            CaptionML = ENU = '', ESP = '';
            Editable = True;
            // NotBlank = false; //Si no permitimos que se quede vacio
            FieldClass = FLowfield;
            CalcFormula = Sum ("Item Ledger Entry".Quantity WHERE ("Item No." = FIELD (Cod), "Source No." = FIELD (cod1), Description = FILTER (<> '')));
        }
        field(4; cod; code[20])
        {
        }
        field(5; cod1; code[20])
        {
        }


    }

    keys
    {
        key(PK; MyField)
        {
            Clustered = true;
        }
    }
 
   

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
 

    //#region variables
    var
        a: Integer;
        b: Decimal

     //#endregion varibales
    //#region funciones
    Caption = '
', comment = 'NLB="YourLanguageCaption"';
    Promoted = true;
    PromotedCategory = Process;
    PromotedIsBig = true;
    Image = Image;

    //#endregion funciones
    //#region EventSubscriber Codeunit er
jy
er
yrey
re
y Trigger
[EventSubscriber(ObjectType::Codeunit, Codeunit::CodeunitName, 'Trigger', '', true, true)]
local procedure Trigger_Cer
jy
er
yrey
re
y(var Rec: Record RecName);
begin
    
end;
//#endregion EventSubscriber Codeunit er


}