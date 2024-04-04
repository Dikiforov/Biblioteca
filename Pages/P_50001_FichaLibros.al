page 50001 "Ficha Libros"
{
    Caption = 'Ficha Libros';
    PageType = Card;
    SourceTable = Libros;
    CardPageId = "Ficha Libros";
    Extensible = true;
    layout
    {
        area(content)
        {
            group("Información Libro")
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;
                }
                field(Descripcion; Rec.Descripcion)
                {
                    ApplicationArea = All;
                }
                field("Descripcion 2"; Rec."Descripcion 2")
                {
                    ApplicationArea = All;
                }
                field("Temática"; Rec.Tematica)
                {
                    ApplicationArea = All;
                }
                field("Año Publicacion"; Rec."Año Publicacion")
                {
                    ApplicationArea = All;
                }
                field(Autor; Rec.Autor)
                {
                    ApplicationArea = All;
                }
                field(Editorial; Rec.Editorial)
                {
                    ApplicationArea = All;
                }
                field(Paginas; Rec.Paginas)
                {
                    ApplicationArea = All;
                }
                field("Importe PVP"; Rec."Importe PVP")
                {
                    ApplicationArea = All;
                }
                field("Cod. Producto"; Rec."Cod. Producto")
                {
                    ApplicationArea = All;
                }
                field(Edad; Rec.Edad)
                {
                    ApplicationArea = All;
                }
                field("Fecha ult. modificacion"; Rec."Fecha ult. modificacion")
                {
                    ApplicationArea = All;
                }
                field(Usuario; Rec.Usuario)
                {
                    ApplicationArea = All;
                }
                field("Descripcion Producto"; Rec."Descripcion Producto")
                {
                    ApplicationArea = All;
                }
                field("calc Descripcion Producto"; Rec."calc Descripcion Producto")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

