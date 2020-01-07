table 50102 "Cosmo Conf. compromiso entrega"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Cliente; Code[20])
        {
            DataClassification = CustomerContent;

        }

        field(10; Periodo; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(20; "Desde hora"; Time)
        {
            DataClassification = CustomerContent;

        }
        field(21; "Desde dia"; option)
        {
            DataClassification = CustomerContent;
            OptionMembers = ,Lunes,Martes,Miércoles,Jueves,Viernes,Sábado,Domingo;

        }
        field(30; "Hasta hora"; Time)
        {
            DataClassification = CustomerContent;

        }
        field(31; "Hasta dia"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = ,Lunes,Martes,Miércoles,Jueves,Viernes,Sábado,Domingo;
        }
        field(40; "Dia envio comprometido"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = ,Lunes,Martes,Miércoles,Jueves,Viernes,Sábado,Domingo;
        }

    }


    keys
    {
        key(PK; Cliente, Periodo, "Desde hora", "Desde dia", "Hasta hora", "Hasta dia")
        {
            Clustered = true;
        }
    }



}