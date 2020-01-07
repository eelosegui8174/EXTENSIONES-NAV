tableextension 50100 "Cosmo T37 Añadir campos plazos" extends "Sales Line"
{
    fields
    {
        field(50100; "Cosmo Dia solicitud requerida"; text[50])
        {
            DataClassification = CustomerContent;


        }
        field(50101; "Cosmo Fecha comprometida"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50102; "Cosmo Dia comprometido"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50103; "Cosmo Solicitado en tiempo"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = ,"En tiempo",Tarde;
        }

    }

}