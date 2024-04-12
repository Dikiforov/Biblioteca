page 50004 "Ficha Autores"
{
    PageType = Card;
    SourceTable = Autores;
    CardPageId = "Ficha Autores";
    Extensible = true;
    layout
    {
        area(Content)
        {
            group("Información Autor")
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;
                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                }
                field(Apellido1; Rec.Apellido1)
                {
                    ApplicationArea = All;
                }
                field(Apellido2; Rec.Apellido2)
                {
                    ApplicationArea = All;
                }
                field("Fecha Nacimiento"; Rec."Fecha Nacimiento")
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
                field("% Descuento"; Rec."% Descuento")
                {
                    ApplicationArea = All;
                }
                field("Filtro Año"; Rec."Filtro Año")
                {
                    ApplicationArea = All;
                    TableRelation = Libros."Año Publicacion";
                    Editable = true;
                }
            }
            group("Listado de libros")
            {
                part("Lista de libros del autor"; "Lista Libros Part")
                {
                    ApplicationArea = All;
                    SubPageLink = Autor = field(Codigo);
                }
            }
        }
    }
}