page 50022 InformacionBiblioteca
{
    Caption = 'Información Biblioteca';
    PageType = CardPart;
    SourceTable = InformacionBiblioteca;

    layout
    {
        area(Content)
        {
            cuegroup(Control54)
            {
                CuegroupLayout = Wide;
                ShowCaption = false;
                field(TotalPrecioLibros; Rec.TotalPrecioLibros)
                {
                    Caption = 'Precio Total Libros';
                    DrillDownPageId = "Lista Libros";
                    ApplicationArea = All;
                }
                field(TotalPaginasLibros; Rec.TotalPaginasLibros)
                {
                    Caption = 'Páginas Total Libros';
                    DrillDownPageId = "Lista Libros";
                    ApplicationArea = All;
                }
            }
            cuegroup("Información Libros")
            {
                Caption = 'Información Libros';
                field(TotalLibros; Rec.TotalLibros)
                {
                    Caption = 'Total Libros';
                    DrillDownPageId = "Lista Libros";
                    ApplicationArea = All;
                }
            }
            cuegroup("Información Autores")
            {
                Caption = 'Información Autores';
                field(TotalAutores; Rec.TotalAutores)
                {
                    Caption = 'Total Autores';
                    DrillDownPageId = "Lista Autores";
                    ApplicationArea = All;
                }
            }
            cuegroup("Información Editoriales")
            {
                Caption = 'Información Editoriales';
                field(TotalEditoriales; Rec.TotalEditoriales)
                {
                    Caption = 'Total Editoriales';
                    DrillDownPageId = "Lista Editoriales";
                    ApplicationArea = All;
                }
            }
            cuegroup("Información Prestamos")
            {
                Caption = 'Información Prestamos';
                field(TotalPrestamos; Rec.TotalPrestamos)
                {
                    Caption = 'Total Prestamos';
                    DrillDownPageId = "Lista Prestamos";
                    ApplicationArea = All;
                }
                // Opción de filtro con activos
                field(PrestamosActivos; Rec.PrestamosActivos)
                {
                    Caption = 'Prestamos Activos';
                    DrillDownPageId = "Lista Prestamos";
                    ApplicationArea = All;
                }
                // Opción de filtro con pasados de fecha actual
                field(PrestamosVencidos; Rec.PrestamosVencidos)
                {
                    Caption = 'Prestamos Vencidos';
                    DrillDownPageId = "Lista Prestamos";
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        recPrestamos: Record "Prestamos Libros";
    begin
        if not rec.Get() then begin
            rec.Init();
            rec.Insert();
        end;

    end;
}