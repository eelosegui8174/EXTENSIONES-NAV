



codeunit 50304 InputBox
{

    trigger OnRun()
    var

        Promp: DotNet Prompt;
        lblRows: DotNet LblRows;
        txtRowsNombre: DotNet TxtRows;
        txtRowsCantidad: DotNet TxtRows;
        ButtonOk: DotNet ButtonOK;
        ButtonCancel: DotNet ButtonCancel;
        DialogResult: DotNet DialogResult;


        FirstLabel: TextConst ENU = 'Name', ESP = 'Nombe';
        SecondLabel: TextConst ENU = 'Qty. Invoiced', ESP = 'Cantidad facturada';
        LabelOK: TextConst ENU = 'OK', ESP = 'OK';
        LabelCancel: TextConst ENU = 'Cancel', ESP = 'Cancelar';

        txtNombre: Text;
        intQty: Decimal;

        Diag: Dialog;

        // win: dotnet InputBox;
        result: Text;

    begin
        // result := win.InputBox('Edad', 'INPUT', '', 100, 100);
        //   message(result);

        //#region Crear formulario
        //1 – Create Input Box as Form
        //-----------------------------------------------------------
        Promp.Width := 350;
        Promp.Height := 180;
        Promp.FormBorderStyle := Promp.FormBorderStyle::Sizable;
        Promp.Text := 'Cuadro de dialogo';
        Promp.StartPosition := Promp.StartPosition::CenterScreen;
        //#endregion Crear formulario

        //#region Crear los labels
        //2 – Add Labels
        //-----------------------------------------------------------
        //1º label
        lblRows := lblRows.Label();
        lblRows.Text(StrSubstNo(FirstLAbel));
        lblRows.Left(20); //Margen sobre la izquierda
        lblRows.top(0);
        Promp.Controls.Add(lblRows);   //añadimos el label al form
                                       //2º label
        lblRows.Text(StrSubstNo(SecondLabel));
        lblRows.Left(20);
        lblRows.top(0);
        Promp.Controls.Add(lblRows);
        //#endregion Crear los labels

        //#region Crear los campos
        //3 – Add Textboxes
        //-----------------------------------------------------------
        //1º PAra el primer label
        txtRowsNombre := txtRowsNombre.TextBox();
        txtRowsNombre.Left(150);
        txtRowsNombre.top(20);
        txtRowsNombre.Width(150);
        Promp.Controls.Add((txtRowsNombre));

        //2º para el segundo label
        txtRowsCantidad := txtRowsCantidad.TextBox();
        txtRowsCantidad.Left(150);
        txtRowsCantidad.top(50);
        txtRowsCantidad.Width(150);
        Promp.Controls.Add((txtRowsCantidad));
        //#endregion Crear los campos

        //#region Crear los botones
        //4 – Add Buttons
        //-----------------------------------------------------------
        //1º Botón de aceptar
        ButtonOk := ButtonOk.Button();
        ButtonOk.Text(StrSubstNo(LabelOK));
        ButtonOk.Left(50);
        ButtonOk.Top(100);
        ButtonOk.Width(50);
        ButtonOk.DialogResult := ButtonOk.DialogResult::OK;
        Promp.Controls.Add((ButtonOk));
        Promp.AcceptButton := ButtonOk;

        //2º Botón de cancelar
        ButtonCancel := ButtonOk.Button();
        ButtonCancel.Text(StrSubstNo(LabelCancel));
        ButtonCancel.Left(50);
        ButtonCancel.Top(100);
        ButtonCancel.Width(50);
        ButtonCancel.DialogResult := ButtonCancel.DialogResult::OK;
        Promp.Controls.Add((ButtonCancel));
        Promp.CancelButton := ButtonCancel;
        //#endregion Crear los botonos

        //#region Recuperar valores
        //5 – Get Results
        //-----------------------------------------------------------
        if (Promp.ShowDialog().ToString() = DialogResult.OK.ToString()) then begin
            if txtRowsNombre.Text <> '' then
                txtNombre := txtRowsNombre.Text;

            if txtRowsCantidad.Text <> '' then
                EVALUATE(intQty, txtRowsCantidad.Text);
        end;

        Promp.Dispose();
        //#endregion Recuperar valores


        diag.open(FirstLabel + '#1############\' +
                 (SecondLabel + '#2###########'));
        diag.Update(1, txtNombre);
        diag.Update(2, intQty);


    end;
}
