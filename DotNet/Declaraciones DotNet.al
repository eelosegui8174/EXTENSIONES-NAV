//Las variables DOTNET SE DECLARAN FUERA
//MUY IMPORTANTE en app.json poner "target": "Internal"
//MUY IMPORTANTE No valen para el Bussines central


//REFERENCIAS DE Dlls
//https://referencesource.microsoft.com/


//En el fichero setting.json tenemos que añadir lo siguiente para que me reconozca el assembly System
//"al.assemblyProbingPaths": [
//        "./.netpackages",
//        "c:/windows/assembly/",
//        "C:/Program Files/Microsoft Dynamics 365 Business Central/130/Service/Add-ins"
//    ]


dotnet
{
    assembly(mscorlib)
    {
        type(System.IO.StreamReader; DotnetStream) { }
        type(System.Text.Encoding; DotNetTextEncoding) { }


    }
    assembly(System)
    {
        //http://navnilesh.blogspot.com/2016/03/popup-window-input-box-in-dynamics-nav.html
        Version = '2.0.0.0';
        //Culture = 'neutral';
        PublicKeyToken = 'b77a5c561934e089';
        // type(System.Windows.Forms.Form; Prompt) { }
        // type(System.Windows.Forms.FormBorderStyle; FormBorderStyle) { }
        // type(System.Windows.Forms.FormStartPosition; FormStartPosition) { }
        // type(System.Windows.Forms.Label; LblRows) { }
        // type(System.Windows.Forms.Label; LblColumns) { }
        // type(System.Windows.Forms.TextBox; TxtRows) { }
        // type(System.Windows.Forms.TextBox; TxtColumns) { }
        // type(System.Windows.Forms.Button; ButtonOK) { }
        // type(System.Windows.Forms.Button; ButtonCancel) { }
        // type(System.Windows.Forms.DialogResult; DialogResult) { }
        type(System.Timers.Timer; MyTimer) { }
        type(System.Timers.ElapsedEventArgs; MyElapsedEventArgs) { }


    }
    assembly(Microsoft.VisualBasic)
    {
        Version = '8.0.0.0';
        Culture = 'neutral';
        PublicKeyToken = 'b03f5f7f11d50a3a';
        type(Microsoft.VisualBasic.Interaction; InputBox) { }


    }
}








