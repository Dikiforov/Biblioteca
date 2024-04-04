page 50005 "Lista Editoriales"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Editoriales;
    CardPageId = "Ficha Editoriales";
    layout
    {
        area(Content)
        {
            repeater("Lista Editoriales")
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;
                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                }
                field(Correo; Rec.Correo)
                {
                    ApplicationArea = All;
                }
                field("Filtro Paginas Autos"; Rec."Filtro Paginas Autos")
                {
                    ApplicationArea = All;
                }
                field("Filtro Total Libros"; Rec."Filtro Total Libros")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}