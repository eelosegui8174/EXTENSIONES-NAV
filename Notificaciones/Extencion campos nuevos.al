codeunit 50213 Gestion_Notificaciones
{

    [EventSubscriber(ObjectType::Table, 18, 'OnAfterValidateEvent', 'Name', false, false)]
    local procedure control_Nombre_Cliente(Rec: Record Customer)
    var
        Notificacion: Notification;

    begin
        if strlen(Rec.Name) < 10 then begin
            //Creamos el mensaje
            Notificacion.Message(Text0001);
            Notificacion.Scope := NotificationScope::LocalScope;

            //Añadimos propiedades del cliente paraluego recoger los valores
            Notificacion.SetData('CodCliente', Rec."No.");
            Notificacion.SetData('NombreCliente', Rec.Name);

            //Añadimos posibles acciones
            Notificacion.AddAction(Text0002, Codeunit::Accion_Notificaciones, 'Rellenar_Nombre_Cliente');

            //Enviamos la notificación
            Notificacion.Send();
        end;
    end;

    var
        Text0001: TextConst ENU = 'Length of the name must be more than 10', ESP = 'La longitud del nombre ha de ser mas de 10';
        Text0002: TextConst ENU = 'Add spaces', ESP = 'Rellenar espacios';




}