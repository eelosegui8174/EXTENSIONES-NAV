page 50100 "cosmo ejemplo list"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Cosmo ejemplo";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Code)
                {
                    ApplicationArea = all;

                }
                field(campo1; campo1)
                {
                    ApplicationArea = All;
                }
                field(campo2; campo2)
                {
                    ApplicationArea = All;
                }
                field(Campo3; Campo3) { ApplicationArea = all; }

            }
        }
        area(Factboxes)
        {

        }
    }


}