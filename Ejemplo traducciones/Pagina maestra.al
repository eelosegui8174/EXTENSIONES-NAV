<<<<<<< HEAD
page 50128 Pagina_Maestra
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(TextBuilderGroup)
            {
                Caption = 'Text Builder';

                field(Campo1; eLabel[1])
                {
                    ShowCaption = false;
                    MultiLine = true;
                }

            }
            group(ListOf)
            {
                Caption = 'List of';
                // field(Name; NameSource)
                // {
                //     ApplicationArea = All;

                // }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TextBuilderAction)
            {
                ApplicationArea = All;
                Caption = 'Text builder';
                Promoted = true;
                PromotedCategory = Process;
                Image = Text;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    TextBuilder();
                end;
            }
            action(ListOfAction)
            {
                ApplicationArea = All;
                Caption = 'List of';
                Promoted = true;
                PromotedCategory = Process;
                Image = Text;
                PromotedIsBig = true;
                trigger OnAction()
                begin

                end;
            }
        }
    }
    //#region Trigers
    trigger
 OnOpenPage()
    begin
        Clear(eCampo);

        Clear(eLabel);
        eLabel[1] := 'myTextBuilder.Append(''Hello I am '');';
        eLabel[1] += 'myTextBuilder.Append(USERID);';
        eLabel[1] += 'myTextBuilder.AppendLine('', live @ Modern Dev Bootcamp!'');';
        eLabel[1] += 'myTextBuilder.Append(''This is so awesome :)'');';
        eLabel[1] += 'MESSAGE(myTextBuilder.ToText());';
        eLabel[1] += 'myTextBuilder.Replace(''Dev'',''Development'');';
        eLabel[1] += 'MESSAGE(myTextBuilder.ToText());';


    end;
    //#endregion Trigers

    //#region Funciones
    local procedure TextBuilder()

    begin
        myTextBuilder.Append('Hello I am ');
        myTextBuilder.Append(USERID);
        myTextBuilder.AppendLine(', live @ Modern Dev Bootcamp!');
        myTextBuilder.Append('This is so awesome :)');
        MESSAGE(myTextBuilder.ToText());
        myTextBuilder.Replace('Dev', 'Development');
        MESSAGE(myTextBuilder.ToText());
    end;
    //#endregion Funciones

    //#region Variables
    var
        myInt: Integer;
        myTextBuilder: TextBuilder;
        eCampo: array[10] of text[50];
        eLabel: array[10] of Text;
        //#endregion Variables

=======
page 50128 Pagina_Maestra
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(TextBuilderGroup)
            {
                Caption = 'Text Builder';

                field(Campo1; eLabel[1])
                {
                    ShowCaption = false;
                    MultiLine = true;
                }

            }
            group(ListOf)
            {
                Caption = 'List of';
                // field(Name; NameSource)
                // {
                //     ApplicationArea = All;

                // }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TextBuilderAction)
            {
                ApplicationArea = All;
                Caption = 'Text builder';
                Promoted = true;
                PromotedCategory = Process;
                Image = Text;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    TextBuilder();
                end;
            }
            action(ListOfAction)
            {
                ApplicationArea = All;
                Caption = 'List of';
                Promoted = true;
                PromotedCategory = Process;
                Image = Text;
                PromotedIsBig = true;
                trigger OnAction()
                begin

                end;
            }
        }
    }
    //#region Trigers
    trigger
 OnOpenPage()
    begin
        Clear(eCampo);

        Clear(eLabel);
        eLabel[1] := 'myTextBuilder.Append(''Hello I am '');';
        eLabel[1] += 'myTextBuilder.Append(USERID);';
        eLabel[1] += 'myTextBuilder.AppendLine('', live @ Modern Dev Bootcamp!'');';
        eLabel[1] += 'myTextBuilder.Append(''This is so awesome :)'');';
        eLabel[1] += 'MESSAGE(myTextBuilder.ToText());';
        eLabel[1] += 'myTextBuilder.Replace(''Dev'',''Development'');';
        eLabel[1] += 'MESSAGE(myTextBuilder.ToText());';


    end;
    //#endregion Trigers

    //#region Funciones
    local procedure TextBuilder()

    begin
        myTextBuilder.Append('Hello I am ');
        myTextBuilder.Append(USERID);
        myTextBuilder.AppendLine(', live @ Modern Dev Bootcamp!');
        myTextBuilder.Append('This is so awesome :)');
        MESSAGE(myTextBuilder.ToText());
        myTextBuilder.Replace('Dev', 'Development');
        MESSAGE(myTextBuilder.ToText());
    end;
    //#endregion Funciones

    //#region Variables
    var
        myInt: Integer;
        myTextBuilder: TextBuilder;
        eCampo: array[10] of text[50];
        eLabel: array[10] of Text;
        //#endregion Variables

>>>>>>> 7ebc8907635d9d20980cdd61fd91b3032026485d
}