pageextension 50001 LineaVenta extends "Sales Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field(CodLibro; Rec.CodLibro)
            {
                Caption = 'Cód. Libro';
                ApplicationArea = All;
                trigger OnValidate()
                var
                    recLibros: Record Libros;
                begin
                    recLibros.SetFilter(Codigo, rec.CodLibro);
                    if (recLibros.FindFirst()) then begin
                        rec.Description := recLibros.Descripcion;
                        rec."Unit Price" := recLibros."Importe PVP";
                        rec.CodAutor := recLibros.Autor;
                        rec.CodEditorial := recLibros.Editorial;
                    end;
                end;
            }

            field(CodAutor; Rec.CodAutor)
            {
                Caption = 'Cód. Autor';
                TableRelation = Autores.Codigo;
                ApplicationArea = All;
                Editable = false;
            }

            field(codEditorial; Rec.CodEditorial)
            {
                Caption = 'Cód. Editorial';
                TableRelation = Editoriales.Codigo;
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}