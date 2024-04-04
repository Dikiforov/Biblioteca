page 50006 "Ficha Editoriales"
{
    PageType = Card;
    SourceTable = Editoriales;
    CardPageId = "Ficha Editoriales";
    Extensible = true;
    layout
    {
        area(Content)
        {
            group("Ficha Editoriales")
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
                field(Autor; Rec.Autor)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Libros: RecordRef;
                    begin
                        if ((Rec.Autor <> '') or (autor <> xRec.Autor)) then begin
                            visibilidadAutores := true;
                            autor := Rec.Autor;
                            CurrPage.Editable(false);
                            CurrPage.Update(true);
                        end;
                    end;

                }
            }
            group("Listado de libros")
            {
                Editable = false;
                part("Lista de libros de la editorial"; "Lista Libros Part")
                {
                    Caption = 'Lista de libros de la editorial';
                    ApplicationArea = All;
                    SubPageLink = Editorial = field(Codigo);
                }
            }
            group("Información autor editorial")
            {
                Caption = 'Información del autor en la editorial';
                Editable = false;
                Visible = visibilidadAutores;
                field(TotalLibros; Rec."Libros Autor Editorial")
                {
                    Caption = 'Total de libros';
                    ApplicationArea = all;
                }
                field(TotalPaginas; Rec."Número Páginas Autor")
                {
                    Caption = 'Total de páginas';
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        visibilidadAutores: boolean;
        autor: Code[10];
        nombreEditorial: Text;

    trigger OnInit()
    begin
        Rec.Autor := '';
        autor := '';
        visibilidadAutores := false;
    end;
}