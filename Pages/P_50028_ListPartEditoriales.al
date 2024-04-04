page 50028 "Lista Editoriales Part"
{
    PageType = ListPart;
    SourceTable = Editoriales;
    //SourceTableView = sorting("Autor");
    layout
    {
        area(content)
        {
            repeater("Lista Editoriales")
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;
                    TableRelation = Editoriales.Codigo;
                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                }
                field(Correo; Rec.Correo)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}