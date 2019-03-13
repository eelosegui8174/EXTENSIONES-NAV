<<<<<<< HEAD
page 50100 Configurador_Base
{
    PageType = NavigatePage;
    ApplicationArea = All;
    UsageCategory = Tasks;
    //SourceTable = xxxx;

    layout
    {
        area(Content)
        {
            group(MediaStandar)
            {
                Caption = '';
                Editable = false;
                Visible = TopBarnnerVisible and ("Pestañas" <> "PestañaFinal");
                field(StandarMedia; MediaResourceStandar."Media Reference")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(MediaDone)
            {
                Caption = '';
                Editable = false;
                Visible = TopBarnnerVisible and ("Pestañas" = "PestañaFinal");
                field(DoneMedia; MediaResouerceDone."Media Reference")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(PaginaInicial)
            {
                Visible = "Pestañas" = 0;
                Caption = 'Initial page';
            }
            group(PrimeraPagina)
            {
                Visible = "Pestañas" = 1;
                field(P1Campo1; campo1pag1)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;

                }

                field(P1Campo2; campo2pag1)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
            }
            group(SegundaPagina)
            {
                Visible = "Pestañas" = 2;
                field(P2Campo1; campo1pag2)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
                field(P2Campo2; campo2pag2)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
            }
            group(TerceraPagina)
            {
                Visible = "Pestañas" = 3;
                field(P3Campo1; campo1pag3)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
                field(P3Campo2; campo2pag3)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }

            }
            group(CuartaPagina)
            {
                Visible = "Pestañas" = 4;
                field(P4Campo1; campo1pag4)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
                field(P4Campo2; campo2pag4)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
            }
            group(PaginaFinal)
            {
                Visible = "Pestañas" = 5;
                caption = 'Final page';

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Inicio)
            {
                ApplicationArea = All;
                InFooterBar = true;
                Visible = VerBotonInicio;
                trigger OnAction()
                begin
                    Volver_Inicio();
                end;
            }
            action(Siguiente)
            {
                ApplicationArea = All;
                Image = NextRecord;
                InFooterBar = true;
                Visible = VerBotonSiguiente;
                trigger OnAction()
                begin
                    Gestion_botones(true);
                end;
            }
            action(Anterior)
            {
                ApplicationArea = All;
                Image = PreviousRecord;
                InFooterBar = true;
                Visible = VerBotonAnterior;
                trigger OnAction()
                begin
                    Gestion_botones(false);
                end;
            }
            action(Finalizar)
            {
                ApplicationArea = All;
                InFooterBar = true;
                Visible = VerBotonFinalizar;
                trigger OnAction()
                begin
                    Fin_proceso();
                end;
            }
        }
    }

    local procedure Gestion_botones(Siguiente: Boolean)
    begin
        //ponemos los botonos a false
        VerBotonAnterior := false;
        VerBotonFinalizar := false;
        VerBotonInicio := false;
        VerBotonSiguiente := false;

        if Siguiente = false then begin
            "Pestañas" -= 1;
        end;

        if Siguiente = true then begin
            "Pestañas" += 1;
        end;

        if "Pestañas" = "PestañaInicial" then begin
            VerBotonSiguiente := true;
        end;

        if "Pestañas" = "PestañaFinal" then begin
            VerBotonFinalizar := true;
            VerBotonAnterior := true;
            VerBotonInicio := true;
        end;

        //Gesyionamos la visibilidad de los botones
        if ("Pestañas" <> "PestañaFinal") and ("Pestañas" <> "PestañaInicial") then begin
            VerBotonInicio := true;
            VerBotonAnterior := true;
        end;

        //miramos a la par como estan los campos rellenos
        Validaciones_campos();
    end;

    local procedure Validaciones_campos()
    begin
        //Gestionamos los contrles en base a la pestaña qe estemos
        if "Pestañas" = 1 then begin
            if (campo1pag1 <> '') and (campo2pag1 <> '') then
                VerBotonSiguiente := true;
        end;
        if "Pestañas" = 2 then begin
            if (campo1pag2 <> '') and (campo2pag2 <> '') then
                VerBotonSiguiente := true;
        end;
        if "Pestañas" = 3 then begin
            if (campo1pag3 <> '') and (campo2pag3 <> '') then
                VerBotonSiguiente := true;
        end;
        if "Pestañas" = 4 then begin
            if (campo1pag4 <> '') and (campo2pag4 <> '') then
                VerBotonSiguiente := true;
        end;
    end;

    local procedure Volver_Inicio()
    begin
        pestañas := 0;
        //ponemos los botonos a false
        VerBotonAnterior := false;
        VerBotonFinalizar := false;
        VerBotonInicio := false;
        VerBotonSiguiente := true;

    end;

    local procedure Fin_proceso()
    begin
    end;

    local procedure LoadTopBanner()
    begin
        if (MediaRepositoryStandar.Get('AssistedSetup-NoText-400px.png', CurrentClientType)) then
            if (MediaRepositorDonde.get('AssistedSetupDone-NoText-400px.png', CurrentClientType())) then
                if (MediaResourceStandar.get(MediaRepositoryStandar."Media Resources Ref")) then
                    if (MediaResouerceDone.get(MediaRepositorDonde."Media Resources Ref")) then
                        TopBarnnerVisible := MediaResouerceDone."Media Reference".HasValue();
    end;

    trigger OnOpenPage()
    begin
        //0 es la inicial y 5 la final en este ejemplo
        "PestañaInicial" := 0;
        "PestañaFinal" := 5;
        "Pestañas" := 0;
        VerBotonSiguiente := true;
    end;

    trigger OnInit()
    begin
        LoadTopBanner();
    end;

    var
        PestañaInicial: Integer;
        PestañaFinal: Integer;
        Pestañas: Integer;
        VerBotonSiguiente: Boolean;
        VerBotonAnterior: Boolean;
        VerBotonFinalizar: Boolean;
        VerBotonInicio: Boolean;
        campo1pag1: Code[20];
        campo2pag1: Code[20];
        campo1pag2: Code[20];
        campo2pag2: Code[20];
        campo1pag3: Code[20];
        campo2pag3: Code[20];
        campo1pag4: Code[20];
        campo2pag4: Code[20];
        //-para los iconos del proceso que aparecen en la parte superior
        MediaRepositoryStandar: Record "Media Repository";
        MediaRepositorDonde: Record "Media Repository";
        MediaResourceStandar: Record "Media Resources";
        MediaResouerceDone: record "Media Resources";
        TopBarnnerVisible: Boolean;

=======
page 50100 Configurador_Base
{
    PageType = NavigatePage;
    ApplicationArea = All;
    UsageCategory = Tasks;
    //SourceTable = xxxx;

    layout
    {
        area(Content)
        {
            group(MediaStandar)
            {
                Caption = '';
                Editable = false;
                Visible = TopBarnnerVisible and ("Pestañas" <> "PestañaFinal");
                field(StandarMedia; MediaResourceStandar."Media Reference")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(MediaDone)
            {
                Caption = '';
                Editable = false;
                Visible = TopBarnnerVisible and ("Pestañas" = "PestañaFinal");
                field(DoneMedia; MediaResouerceDone."Media Reference")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(PaginaInicial)
            {
                Visible = "Pestañas" = 0;
                Caption = 'Initial page';
            }
            group(PrimeraPagina)
            {
                Visible = "Pestañas" = 1;
                field(P1Campo1; campo1pag1)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;

                }

                field(P1Campo2; campo2pag1)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
            }
            group(SegundaPagina)
            {
                Visible = "Pestañas" = 2;
                field(P2Campo1; campo1pag2)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
                field(P2Campo2; campo2pag2)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
            }
            group(TerceraPagina)
            {
                Visible = "Pestañas" = 3;
                field(P3Campo1; campo1pag3)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
                field(P3Campo2; campo2pag3)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }

            }
            group(CuartaPagina)
            {
                Visible = "Pestañas" = 4;
                field(P4Campo1; campo1pag4)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
                field(P4Campo2; campo2pag4)
                {
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
            }
            group(PaginaFinal)
            {
                Visible = "Pestañas" = 5;
                caption = 'Final page';

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Inicio)
            {
                ApplicationArea = All;
                InFooterBar = true;
                Visible = VerBotonInicio;
                trigger OnAction()
                begin
                    Volver_Inicio();
                end;
            }
            action(Siguiente)
            {
                ApplicationArea = All;
                Image = NextRecord;
                InFooterBar = true;
                Visible = VerBotonSiguiente;
                trigger OnAction()
                begin
                    Gestion_botones(true);
                end;
            }
            action(Anterior)
            {
                ApplicationArea = All;
                Image = PreviousRecord;
                InFooterBar = true;
                Visible = VerBotonAnterior;
                trigger OnAction()
                begin
                    Gestion_botones(false);
                end;
            }
            action(Finalizar)
            {
                ApplicationArea = All;
                InFooterBar = true;
                Visible = VerBotonFinalizar;
                trigger OnAction()
                begin
                    Fin_proceso();
                end;
            }
        }
    }

    local procedure Gestion_botones(Siguiente: Boolean)
    begin
        //ponemos los botonos a false
        VerBotonAnterior := false;
        VerBotonFinalizar := false;
        VerBotonInicio := false;
        VerBotonSiguiente := false;

        if Siguiente = false then begin
            "Pestañas" -= 1;
        end;

        if Siguiente = true then begin
            "Pestañas" += 1;
        end;

        if "Pestañas" = "PestañaInicial" then begin
            VerBotonSiguiente := true;
        end;

        if "Pestañas" = "PestañaFinal" then begin
            VerBotonFinalizar := true;
            VerBotonAnterior := true;
            VerBotonInicio := true;
        end;

        //Gesyionamos la visibilidad de los botones
        if ("Pestañas" <> "PestañaFinal") and ("Pestañas" <> "PestañaInicial") then begin
            VerBotonInicio := true;
            VerBotonAnterior := true;
        end;

        //miramos a la par como estan los campos rellenos
        Validaciones_campos();
    end;

    local procedure Validaciones_campos()
    begin
        //Gestionamos los contrles en base a la pestaña qe estemos
        if "Pestañas" = 1 then begin
            if (campo1pag1 <> '') and (campo2pag1 <> '') then
                VerBotonSiguiente := true;
        end;
        if "Pestañas" = 2 then begin
            if (campo1pag2 <> '') and (campo2pag2 <> '') then
                VerBotonSiguiente := true;
        end;
        if "Pestañas" = 3 then begin
            if (campo1pag3 <> '') and (campo2pag3 <> '') then
                VerBotonSiguiente := true;
        end;
        if "Pestañas" = 4 then begin
            if (campo1pag4 <> '') and (campo2pag4 <> '') then
                VerBotonSiguiente := true;
        end;
    end;

    local procedure Volver_Inicio()
    begin
        pestañas := 0;
        //ponemos los botonos a false
        VerBotonAnterior := false;
        VerBotonFinalizar := false;
        VerBotonInicio := false;
        VerBotonSiguiente := true;

    end;

    local procedure Fin_proceso()
    begin
    end;

    local procedure LoadTopBanner()
    begin
        if (MediaRepositoryStandar.Get('AssistedSetup-NoText-400px.png', CurrentClientType)) then
            if (MediaRepositorDonde.get('AssistedSetupDone-NoText-400px.png', CurrentClientType())) then
                if (MediaResourceStandar.get(MediaRepositoryStandar."Media Resources Ref")) then
                    if (MediaResouerceDone.get(MediaRepositorDonde."Media Resources Ref")) then
                        TopBarnnerVisible := MediaResouerceDone."Media Reference".HasValue();
    end;

    trigger OnOpenPage()
    begin
        //0 es la inicial y 5 la final en este ejemplo
        "PestañaInicial" := 0;
        "PestañaFinal" := 5;
        "Pestañas" := 0;
        VerBotonSiguiente := true;
    end;

    trigger OnInit()
    begin
        LoadTopBanner();
    end;

    var
        PestañaInicial: Integer;
        PestañaFinal: Integer;
        Pestañas: Integer;
        VerBotonSiguiente: Boolean;
        VerBotonAnterior: Boolean;
        VerBotonFinalizar: Boolean;
        VerBotonInicio: Boolean;
        campo1pag1: Code[20];
        campo2pag1: Code[20];
        campo1pag2: Code[20];
        campo2pag2: Code[20];
        campo1pag3: Code[20];
        campo2pag3: Code[20];
        campo1pag4: Code[20];
        campo2pag4: Code[20];
        //-para los iconos del proceso que aparecen en la parte superior
        MediaRepositoryStandar: Record "Media Repository";
        MediaRepositorDonde: Record "Media Repository";
        MediaResourceStandar: Record "Media Resources";
        MediaResouerceDone: record "Media Resources";
        TopBarnnerVisible: Boolean;

>>>>>>> 7ebc8907635d9d20980cdd61fd91b3032026485d
}