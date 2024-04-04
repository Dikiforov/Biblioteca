tableextension 50000 NroSeries extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Libro Nos."; Code[10])
        {
            Caption = 'Libro Nos.';
            TableRelation = "No. Series";
        }
        field(50001; "Autor Nos."; Code[10])
        {
            Caption = 'Autor Nos.';
            TableRelation = "No. Series";
        }
        field(50002; "Editorial Nos."; Code[15])
        {
            Caption = 'Editorial Nos.';
            TableRelation = "No. Series";
        }
        field(50003; "Código SII"; Code[20])
        {
            Caption = 'Código SII';
            TableRelation = "No. Series";
        }
        field(50004; "Intervalo Edad Nos."; Code[20])
        {
            Caption = 'Intervalo Edad Nos.';
            TableRelation = "No. Series";
        }
        field(50005; "Tipo de Facturación Automática"; Enum "Tipo Facturación Automática")
        {
            DataClassification = ToBeClassified;
        }

    }
}