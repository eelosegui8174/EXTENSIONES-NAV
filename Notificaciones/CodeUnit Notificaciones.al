codeunit 50212 Accion_Notificaciones
{
    procedure Rellenar_Nombre_Cliente(Notificacion: Notification)
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