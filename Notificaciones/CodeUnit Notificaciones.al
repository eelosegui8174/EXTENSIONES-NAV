codeunit 50214 Accion_Notificaciones
{
    procedure Rellenar_Nombre_Cliente_Espacios(Notificacion: Notification)
    var
        eCliente: Record Customer;
        ecodCliente: Code[20];
    begin
        ecodCliente := Notificacion.GetData('CodCliente');

        CLEAR(eCliente);
        ecliente.get(ecodcliente);

        ecliente.name := PADSTR(eCliente.Name, 10, ' ');
        ecliente.modify;

    end;

    procedure Rellenar_Nombre_Cliente_Puntos(Notificacion: Notification)
    var
        eCliente: Record Customer;
        ecodCliente: Code[20];
    begin
        ecodCliente := Notificacion.GetData('CodCliente');

        CLEAR(eCliente);
        ecliente.get(ecodcliente);

        ecliente.name := PADSTR(eCliente.Name, 10, '.');
        ecliente.modify;

    end;

}