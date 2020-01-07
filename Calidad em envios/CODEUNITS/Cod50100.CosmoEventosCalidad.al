codeunit 50100 "Cosmo Eventos Calidad"
{
    var
        cControlDeCalidad: Codeunit "Cosmo Control de calidad";


        //------------------------------------------------------------------------------------------------------
        //CUSTOMER
        //------------------------------------------------------------------------------------------------------
        //LIST
    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnAfterActionEvent', 'CosmoConfAprobaciones', true, true)]
    local procedure CustList_On_action_ConfAprobaciones(Rec: Record Customer)
    begin
        cControlDeCalidad.AbreConfAprobaciones(rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterActionEvent', 'CosmoConfAprobaciones', true, true)]
    local procedure CustCard_On_action_ConfAprobaciones(Rec: Record Customer)
    begin
        cControlDeCalidad.AbreConfAprobaciones(rec);
    end;

    //Card
    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnAfterActionEvent', 'CosmoLogCalidadEnvios', true, true)]
    local procedure CustList_On_action_LogCalidadEnvios(Rec: Record Customer)
    begin
        cControlDeCalidad.AbreLogCalidadEnvios(rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterActionEvent', 'CosmoLogCalidadEnvios', true, true)]
    local procedure CustCard_On_action_LogCalidadEnvios(Rec: Record Customer)
    begin
        cControlDeCalidad.AbreLogCalidadEnvios(rec);
    end;

    //------------------------------------------------------------------------------------------------------
    //SALES ORDER
    //------------------------------------------------------------------------------------------------------
    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnAfterActionEvent', 'CosmoConfAprobaciones', true, true)]
    local procedure SalesOrder_On_action_ConfAprobaciones(Rec: Record "Sales Header")
    begin
        cControlDeCalidad.Abre_Conf_Plazos_Cliente_Desde_Pedido_Venta(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnAfterActionEvent', 'CosmoLogCalidadEnvios', true, true)]
    local procedure SalesOrder_On_action_LogAprobaciones(Rec: Record "Sales Header")
    begin
        cControlDeCalidad.Abre_Log_Plazos_Cliente_Desde_Pedido_Venta(rec);
    end;


    //------------------------------------------------------------------------------------------------------
    //SALES LINE
    //------------------------------------------------------------------------------------------------------
    [EventSubscriber(ObjectType::Table, database::"Sales Line", 'OnAfterInsertEvent', '', true, true)]
    local procedure T37_On_Insert_Sales_Line(var Rec: Record "Sales Line")
    begin
        cControlDeCalidad.On_Insert_Sales_Line(Rec);
    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Line", 'OnBeforeModifyEvent', '', true, true)]
    local procedure T37_On_Modify_Sales_Line(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
        cControlDeCalidad.On_Modify_Sales_Line(Rec, xRec);

    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Line", 'OnAfterDeleteEvent', '', true, true)]
    local procedure T37_On_Delete_Sales_Line(var Rec: Record "Sales Line")
    begin
        cControlDeCalidad.On_Delete_Sales_Line(Rec);

    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Line", 'OnAfterValidateEvent', 'Requested Delivery Date', false, false)]
    local procedure On_Aftervalidate_RequestDate(Rec: record "Sales Line"; xRec: record "Sales Line")
    begin
        cControlDeCalidad.On_Aftervalidate_RequestDate(Rec, xRec);
    end;
    //------------------------------------------------------------------------------------------------------
    //CODEUNIT 80
    //------------------------------------------------------------------------------------------------------
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesShptLineInsert', '', true, true)]
    local procedure C80_OnAfterSalesShptLineInsert(SalesShipmentLine: Record "Sales Shipment Line")
    begin
        cControlDeCalidad.C80_OnAfterSalesShptLineInsert(SalesShipmentLine);
    end;

}

