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

}








