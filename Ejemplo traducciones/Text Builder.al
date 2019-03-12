page 50129 Text_Builder
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Campo1)
                {
                    ApplicationArea = All;

                }
                field(SurName; Campo2)
                {
                    ApplicationArea = All;

                }
                field(Age; Campo3)
                {
                    ApplicationArea = All;

                }
                field(Direcction; Campo4)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Acciones)
            {
                ApplicationArea = All;
                Caption = 'TextBuilder message';
                trigger OnAction()
                begin
                    myTextBuilder2.Clear();
                    myTextBuilder2.Append('Hola ' + campo1);

                    myTextBuilder2.AppendLine();
                    myTextBuilder2.Append('con apodo ');
                    myTextBuilder2.Append(campo2);
                    myTextBuilder2.AppendLine();
                    myTextBuilder2.Append('Con edad de ');
                    myTextBuilder2.Append(campo3);
                    myTextBuilder2.AppendLine();
                    myTextBuilder2.Append(campo4);
                    Message((myTextBuilder2.ToText()));
                end;
            }
        }
    }
    trigger
    OnOpenPage()
    begin
     
    end;

    var
   
        myTextBuilder2: TextBuilder;
        campo1: Text[50];
        campo2: Text[50];
        campo3: Text[50];
        campo4: Text[50];

}