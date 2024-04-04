page 50020 "Lista Libros Part"
{
    PageType = ListPart;
    SourceTable = Libros;
    //SourceTableView = sorting("Autor");
    layout
    {
        area(content)
        {
            repeater("Lista Libros")
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;
                    TableRelation = Libros.Codigo;
                }
                field(Descripcion; Rec.Descripcion)
                {
                    ApplicationArea = All;
                }
                field("Descripcion 2"; Rec."Descripcion 2")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Tematica; Rec.Tematica)
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
                    Visible = false;
                }
                field(Editorial; Rec.Editorial)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Paginas; Rec.Paginas)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Importe PVP"; Rec."Importe PVP")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Cod. Producto"; Rec."Cod. Producto")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Edad; Rec.Edad)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Fecha ult. modificacion"; Rec."Fecha ult. modificacion")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Usuario; Rec.Usuario)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Descripcion Producto"; Rec."Descripcion Producto")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
    }
}