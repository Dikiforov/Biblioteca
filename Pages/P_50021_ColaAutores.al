page 50021 ColaAutores
{
    PageType = CardPart;
    SourceTable = ColaAutores;
    layout
    {
        area(Content)
        {
            cuegroup(TotalAutores)
            {
                Caption = ' ';
                field(ColaTotalAutores; Rec.TotalAutores)
                {
                    Caption = 'Autores Total';
                    ApplicationArea = All;
                    DrillDownPageId = "Lista Autores";
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