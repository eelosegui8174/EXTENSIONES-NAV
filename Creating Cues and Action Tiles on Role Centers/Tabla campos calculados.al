//https://docs.microsoft.com/es-es/dynamics365/business-central/dev-itpro/developer/devenv-cues-action-tiles
table 50310 SalesInvoiceCueTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[250])
        {

            DataClassification = ToBeClassified;
        }

        //#region sales
        field(2; SalesInvoicesOpen; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count ("Sales Header" where ("Document Type" = Filter (Invoice)));

        }
        field(3; SalesOrders; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count ("Sales Header" where ("Document Type" = Filter (Order)));

        }
        //#endregion sales



        //#region purchases
        field(20; PurchaseInvoicesOpen; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count ("Purchase Header" where ("Document Type" = Filter (Invoice)));

        }
        field(21; PurchaseOrders; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count ("Purchase Header" where ("Document Type" = Filter (Order)));
        }
        //#endregion purchases
    }

    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}