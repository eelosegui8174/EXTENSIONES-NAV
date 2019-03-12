codeunit 50110 Notificaciones
{


    [EventSubscriber(ObjectType::Table, 18, 'OnAfterModifyEvent', '', false, false)]
    procedure On_Before_Modify_Customer(Rec: Record Customer)
    var
        myNotificacion: Notification;

    begin
        if strlen(rec.Name) < 10 then begin
            myNotificacion.Message(Notificacion1);
            myNotificacion.Send();
        end;
        message('a');
    end;





    procedure Control_Nombre_Cliente(Contro: Notification)
    begin

    end;

    var
        myInt: Integer;
        Notificacion1: TextConst ENU = 'Name must be longer than 10', ESP = 'Nombre ha de ser mayor que 10';
}