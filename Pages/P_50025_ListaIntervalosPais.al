page 50025 ListaIntervalosPais
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Intervalos Renovación NIF";

    layout
    {
        area(Content)
        {
            repeater(Intervalos)
            {
                field(CodPais; Rec.CodPais)
                {
                    Caption = 'Código País';
                    ApplicationArea = All;
                }
                field(Intervalo_1; Rec.Intervalo_1)
                {
                    Caption = 'Intervalo 1';
                    ApplicationArea = All;
                }
                field(Intervalo_2; Rec.Intervalo_2)
                {
                    Caption = 'Intervalo 2';
                    ApplicationArea = All;
                }
                field(Intervalo_3; Rec.Intervalo_3)
                {
                    Caption = 'Intervalo 3';
                    ApplicationArea = All;
                }
                field(Intervalo_4; Rec.Intervalo_4)
                {
                    Caption = 'Intervalo 4';
                    ApplicationArea = All;
                }
            }
        }
    }
}