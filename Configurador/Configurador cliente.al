
page 50251 Configurador_Cliente
{
    PageType = NavigatePage;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = Customer;
    Caption = 'Customer Setup';

    layout
    {
        area(Content)
        {
            //iconos de arriba de proceso
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
                Caption = 'Push finish to confirm the customer';
                Editable = false;
                Visible = TopBarnnerVisible and ("Pestañas" = "PestañaFinal");
                field(DoneMedia; MediaResouerceDone."Media Reference")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            //pestañas de rellenar campos
            group(PaginaInicial)
            {
                Visible = "Pestañas" = "PestañaInicial";
                Caption = 'Initial page';
            }
            group(PrimeraPagina)
            {
                Visible = "Pestañas" = 1;
                field(Nombre; eCliente.Name)
                {
                    Caption = 'Name';
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;

                }

                field(Nombre2; eCliente."Name 2")
                {
                    Caption = 'Name 2';
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
            }
            group(SegundaPagina)
            {
                Visible = "Pestañas" = 2;
                Caption = 'Address';
                group(Dir)
                {
                    Caption = 'Customer address';

                    field(Direccion1; eCliente.Address)
                    {
                        ShowMandatory = true;
                        trigger OnValidate()
                        begin
                            validaciones_Campos;
                        end;
                    }
                    field(Direccion2; eCliente."Address 2")
                    {
                        Caption = 'Customer address 2';
                        ShowMandatory = true;
                        trigger OnValidate()
                        begin
                            validaciones_Campos;
                        end;
                    }

                    field(Poblacion; eCliente.City)
                    {
                        Caption = 'City';
                        trigger OnValidate()
                        begin
                            validaciones_Campos;
                        end;
                    }
                }
                group(Card)
                {
                    Caption = 'Contact';
                    field("Phone"; eCliente."Phone No.")
                    {
                        Caption = 'Phone';
                    }
                    field("E-mail"; eCliente."E-Mail")
                    {
                        Caption = 'E-Mail';
                    }
                    field("Fax"; eCliente."Fax No.")
                    {
                        Caption = 'Fax';
                    }

                }
            }

            group(TerceraPagina)
            {
                Visible = "Pestañas" = 3;
                Field("Gen. Bus. Posting Group"; eCliente."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }
                Field("VAT Bus. Posting Group"; eCliente."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;


                }
                Field("Customer Posting Group"; eCliente."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        validaciones_Campos;
                    end;
                }


            }

            group(PaginaFinal)
            {
                Visible = "Pestañas" = "PestañaFinal";
                caption = 'Final page';

            }
            //para separar los botones y qede mas bonito
        }
    }

    actions
    {
        area(Processing)
        {
            action(Inicio)
            {
                Caption = 'Init';
                ApplicationArea = All;
                InFooterBar = true;
                Visible = VerBotonInicio;
                Image = Insert;
                trigger OnAction()
                begin
                    Volver_Inicio();
                end;
            }
            action(Anterior)
            {
                Caption = 'Previous';
                ApplicationArea = All;
                Image = PreviousRecord;
                InFooterBar = true;
                Visible = VerBotonAnterior;
                trigger OnAction()
                begin
                    Gestion_botones(false);
                end;
            }
            action(Siguiente)
            {
                Caption = 'Next';
                ApplicationArea = All;
                Image = NextRecord;
                InFooterBar = true;
                Visible = VerBotonSiguiente;
                trigger OnAction()
                begin
                    Gestion_botones(true);
                end;
            }

            action(Finalizar)
            {
                Caption = 'Finish';
                ApplicationArea = All;
                InFooterBar = true;
                Visible = VerBotonFinalizar;
                Image = Process;
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
            if (eCliente.Name <> '') and (eCliente."Name 2" <> '') then
                VerBotonSiguiente := true;
        end;
        if "Pestañas" = 2 then begin
            if (eCliente.Address <> '') and (eCliente."Address 2" <> '') then
                VerBotonSiguiente := true;
        end;
        if "Pestañas" = 3 then begin
            //en este caso no obligamos
            if (eCliente."Gen. Bus. Posting Group" <> '') and (eCliente."VAT Bus. Posting Group" <> '')
               and (eCliente."Customer Posting Group" <> '') then
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
    var
        PageCliente: Page "Customer Card";
        Codigo: Code[20];
    begin
        eCliente.insert(true);
        Codigo := eCliente."No.";
        ecliente.SetRange("No.", Codigo);

        PageCliente.SetTableView(eCliente);
        PageCliente.run;
        CurrPage.Close();
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
        "PestañaFinal" := 4;
        "Pestañas" := 0;
        VerBotonSiguiente := true;
        eCliente.init;
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
        eCliente: Record Customer;        //-para los iconos del proceso que aparecen en la parte superior
        MediaRepositoryStandar: Record "Media Repository";
        MediaRepositorDonde: Record "Media Repository";
        MediaResourceStandar: Record "Media Resources";
        MediaResouerceDone: record "Media Resources";
        TopBarnnerVisible: Boolean;

}