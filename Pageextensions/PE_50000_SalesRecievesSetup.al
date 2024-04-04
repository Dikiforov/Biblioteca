pageextension 50000 "50000_ExtSalesRecieves" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            field("Tipo de Facturación Automática"; Rec."Tipo de Facturación Automática")
            {
                Caption = 'Tipo Facturación Automática';
                ApplicationArea = All;
            }
        }
        addlast("Number Series")
        {
            field("Libro Nos."; Rec."Libro Nos.")
            {
                Caption = 'Libro Nos.';
                ApplicationArea = All;
            }
            field("Autor Nos."; Rec."Autor Nos.")
            {
                Caption = 'Autor Nos.';
                ApplicationArea = All;
            }
            field("Editorial Nos."; Rec."Editorial Nos.")
            {
                Caption = 'Editorial Nos.';
                ApplicationArea = All;
            }
            field("Código SII"; Rec."Código SII")
            {
                Caption = 'Nos. SII';
                ApplicationArea = All;
            }
            field("Intervalo Edad Nos."; Rec."Intervalo Edad Nos.")
            {
                Caption = 'Intervalo Edad Nos.';
                ApplicationArea = All;
            }
        }
    }
}
