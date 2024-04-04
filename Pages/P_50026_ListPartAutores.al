page 50027 "Lista Autores Part"
{
    PageType = ListPart;
    SourceTable = Autores;
    //SourceTableView = sorting("Autor");
    layout
    {
        area(content)
        {
            repeater("Lista Autores")
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;
                    TableRelation = Autores.Codigo;
                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                }
                field(Apellido1; Rec.Apellido1)
                {
                    ApplicationArea = All;
                }
                field("Número Libros"; Rec."Número Libros")
                {
                    ApplicationArea = All;
                }
                field("Número Páginas"; Rec."Número Páginas")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}