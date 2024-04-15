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