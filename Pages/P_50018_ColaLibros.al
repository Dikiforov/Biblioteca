page 50018 ColaLibros
{
    PageType = CardPart;
    SourceTable = ColaLibros;
    layout
    {
        area(Content)
        {
            cuegroup(TotalPrecioLibros)
            {
                Caption = ' ';
                field(ColaPreciosLibros; Rec.BooksPriceOpen)
                {
                    Caption = 'Precio Total';
                    ApplicationArea = All;
                    DrillDownPageId = "Lista Libros";
                }
            }
            cuegroup(TotalLibrosContenedor)
            {
                Caption = ' ';
                field(ColaTotalLibros; Rec.TotalBooks)
                {
                    Caption = 'Total Libros';
                    ApplicationArea = All;
                    DrillDownPageId = "Vendor Card";
                }
            }
        }
    }
    trigger OnInit();
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}