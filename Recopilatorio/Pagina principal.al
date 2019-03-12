page 50140 Principal
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(Tradcution)
            {
                group(Grupo)
                {
                    Caption = 'Traduction';
                    field(TextTrad; TextoTraduccion)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                    }
                    field(Array1; ArrayTraduccion[1])
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                    }
                    field(Array2; ArrayTraduccion[2])
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                    }
                    field(Array3; ArrayTraduccion[3])
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                    }
                    field(Array4; ArrayTraduccion[4])
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                    }
                    field(Array5; ArrayTraduccion[5])
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                    }
                    field(Array6; ArrayTraduccion[6])
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                    }
                    field(Array7; ArrayTraduccion[7])
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                    }
                    field(Array8; ArrayTraduccion[8])
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                    }
                }
            }
            group(Configurador)
            {
                caption = 'Configuration page';
                field(TextConf; TextoConfigurador)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Editable = false;
                }
            }
            group(Variables)
            {
                Caption = 'Types of variables';
                field(Var1; ArrayVariables[1])
                {
                    Caption = 'Text';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Var2; ArrayVariables[2])
                {
                    Caption = 'Integer';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Var3; ArrayVariables[3])
                {
                    Caption = 'Code';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Var4; ArrayVariables[4])
                {
                    Caption = 'Array';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Var5; ArrayVariables[5])
                {

                    ApplicationArea = All;
                    Editable = false;
                }
                field(Var6; ArrayVariables[6])
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Var7; ArrayVariables[7])
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger
    OnOpenPage()
    begin
        Rellena_Array_Traduccion();
        Rellena_Array_Variables();
    end;

    //#region Funciones
    local procedure Rellena_Array_Traduccion()
    begin
        ArrayTraduccion[1] := 'En fichero app.json añadir la cadena';
        ArrayTraduccion[2] := '"features": [ "TranslationFile" ]';
        ArrayTraduccion[3] := 'Pulsar F1 y ejecutar el comando ';
        ArrayTraduccion[4] := 'AL: Package';
        ArrayTraduccion[5] := 'Se creara una carpeta llamada Traductions';
        ArrayTraduccion[6] := 'Copiar el fichero acabado en g.xlf y crear uno nuevo con g.ESP.xlf';
        ArrayTraduccion[7] := 'Debajo de cada etiqueta de <source>Traduction</source> poner';
        ArrayTraduccion[8] := '<target>Traducciones</target>';
    end;

    local procedure Rellena_Array_Variables()
    begin
        ArrayVariables[1] := 'VarText : Text  Or VarText : Text[50]';
        ArrayVariables[2] := 'VarInt : Integer';
        ArrayVariables[3] := 'sss';
        ArrayVariables[4] := 'sss';
        ArrayVariables[5] := 'sss';
        ArrayVariables[6] := 'sss';
        ArrayVariables[7] := 'sss';
        ArrayVariables[8] := 'sss';
    end;
    //#endregion Funciones
    //#region Variables globales
    var
        myInt: Integer;
        TextoConfigurador: Text;
        TextoTraduccion: Text;
        ArrayTraduccion: array[10] of Text;
        ArrayVariables: array[20] of Text;
        TextArray: array[20] of Text;
        //#endregion Variables globales

}