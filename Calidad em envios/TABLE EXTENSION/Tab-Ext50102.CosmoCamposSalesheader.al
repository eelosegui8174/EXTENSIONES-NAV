tableextension 50102 "Cosmo Campos Sales header" extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here

        field(50100; "Cosmo Cant en lineas venta"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum ("Sales Line".Quantity where ("Document Type" = field ("Document Type"),
                                                           "Document no." = field ("No."),
                                                           Type = const (Item)));
        }
        field(50101; "Cosmo Total solicitado OT"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum ("Sales Line".Quantity where ("Document Type" = field ("Document Type"),
                                                           "Document no." = field ("No."),
                                                           "Cosmo Solicitado en tiempo" = const ("En tiempo")));
        }
        field(50102; "Cosmo Total solicitado T"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum ("Sales Line".Quantity where ("Document Type" = field ("Document Type"),
                                                           "Document no." = field ("No."),
                                                           "Cosmo Solicitado en tiempo" = const ("Tarde")));
        }
    }

}