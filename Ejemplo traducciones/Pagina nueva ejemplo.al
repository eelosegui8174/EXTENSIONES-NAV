<<<<<<< HEAD
page 50130 Pagina_ejemplo_traducciones
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Ejemplo_Tradcutor;
    Caption = 'Traduced page example';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code', Comment = 'Customer Code';
                }
                field(Name; Name)
                {
                   //#region Pruebas    
                   
                   //#endregion prueba
                    Caption = 'Name', Comment = 'Customer name';
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
    trigger OnOpenPage()
    begin

    end;


    var


=======
page 50130 Pagina_ejemplo_traducciones
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Ejemplo_Tradcutor;
    Caption = 'Traduced page example';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code', Comment = 'Customer Code';
                }
                field(Name; Name)
                {
                   //#region Pruebas    
                   
                   //#endregion prueba
                    Caption = 'Name', Comment = 'Customer name';
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
    trigger OnOpenPage()
    begin

    end;


    var


>>>>>>> 7ebc8907635d9d20980cdd61fd91b3032026485d
}