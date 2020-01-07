page 50100 "Cosmo Conf. compromiso entrega"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Cosmo Conf. compromiso entrega";


    layout
    {


        area(Content)
        {
            repeater(GroupName)
            {


                field(Cliente; Cliente)
                {
                    ApplicationArea = All;
                }
                field("Desde dia"; "Desde dia")
                {
                    ApplicationArea = All;
                }
                field("Desde hora"; "Desde hora")
                {
                    ApplicationArea = All;
                }
                field("Hasta dia"; "Hasta dia")
                {
                    ApplicationArea = All;
                }
                field("Hasta hora"; "Hasta hora")
                {
                    ApplicationArea = All;
                }
                field("Dia envio comprometido"; "Dia envio comprometido")
                {
                    ApplicationArea = All;
                }

                field(Periodo; Periodo)
                {
                    ApplicationArea = All;
                }
            }
            group(Campos)
            {


                field(CodCliente; CodCliente)
                {
                    ApplicationArea = All;
                }
                field(FechaRequerida; FechaRequerida)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        DiaPide := DameDia(FechaRequerida)
                    end;
                }
                field(DiaPide; DiaPide) { ApplicationArea = All; }
                field(Fecha; Fecha)
                {
                    ApplicationArea = ALl;
                    caption = 'Fecha pedido';
                    trigger OnValidate()
                    begin
                        DiaActual := DameDia(Fecha)
                    end;
                }
                field(DiaActual; DiaActual) { ApplicationArea = All; }
                field(Hora; Hora) { ApplicationArea = All; }
            }
        }


    }
    actions
    {
        area(Processing)
        {
            action(Prueba)
            {
                Image = Debug;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    T37: Record "Sales Line";
                    cControlesCalidad: codeunit "Cosmo Control de calidad";

                begin
                    cControlesCalidad.Control_Fecha_Requerida_En_Tiempo(T37, Rec.Cliente, Fecha, Hora, FechaRequerida, true);
                end;
            }
        }
    }

    var
        CodCliente: code[20];
        FechaRequerida: Date;
        Fecha: Date;
        DiaPide: Text;
        DiaActual: text;
        Hora: Time;



    procedure DameDia(Fecha: Date): text
    var
        tDatePide: record Date;
    begin

        //1º buscamos el dia que pide

        IF Fecha <> 0D THEN BEGIN
            CLEAR(tDatePide);
            tDatePide.SETRANGE("Period Type", 0);  //dia
            tDatePide.SETRANGE("Period Start", Fecha);
            IF tDatePide.FINDFIRST() THEN
                EXIT(tDatePide."Period Name");
        END;

    end;


}