// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!
pageextension 50108 Conectar extends "Customer List"
{


    actions
    {
        addlast(Reports)
        {
            action(Conectar)
            {
                Caption = 'Hola extension';
                PromotedCategory = Report;
                Promoted = true;
                trigger OnAction()
                var
                    Eventos_coches: Codeunit Eventos_Coches;
                begin
                    Eventos_coches.Hola_Extension();
                end;
            }
        }
    }


}