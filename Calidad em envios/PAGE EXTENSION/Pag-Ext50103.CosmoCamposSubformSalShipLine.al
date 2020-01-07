pageextension 50103 "Cosmo CamposSubformSalShipLine" extends 131
{
    layout
    {
        addafter("Quantity Invoiced")
        {

            field("Cosmo Dia comprometido"; "Cosmo Dia comprometido")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Cosmo Dia solicitud requerida"; "Cosmo Dia solicitud requerida")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Cosmo Fecha comprometida"; "Cosmo Fecha comprometida")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Cosmo Solicitado en tiempo"; "Cosmo Solicitado en tiempo")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Cosmo Entregado en tiempo"; "Cosmo Entregado en tiempo")
            {
                ApplicationArea = All;
                Editable = false;
                StyleExpr = CorlorRojo;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        CorlorRojo := '';
        if "Cosmo Solicitado en tiempo" = "Cosmo Solicitado en tiempo"::Tarde then
            CorlorRojo := 'Unfavorable';
    end;

    var
        CorlorRojo: Text;
}



