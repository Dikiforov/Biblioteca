page 50019 ColaEditoriales
{
    PageType = CardPart;
    SourceTable = ColaEditoriales;
    layout
    {
        area(Content)
        {
            cuegroup(TotalEditorialesGrupo)
            {
                Caption = ' ';
                field(ColaEditorialesTotal; Rec.TotalEditoriales)
                {
                    Caption = 'Total Editoriales';
                    ApplicationArea = All;
                    DrillDownPageId = "Lista Editoriales";
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