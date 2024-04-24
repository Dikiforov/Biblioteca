page 50026 ListaIntervalosEdad
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = IntervalosPorEdad;

    layout
    {
        area(Content)
        {
            repeater(Intervalos)
            {
                field("Código Intervalo"; Rec."Código Intervalo")
                {
                    ApplicationArea = All;
                }
                field("Edad Mínima"; Rec."Edad Mínima")
                {
                    ApplicationArea = All;
                }
                field("Edad Máxima"; Rec."Edad Máxima")
                {
                    ApplicationArea = All;
                }
                field("Años Renovación"; Rec."Años Renovación")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}