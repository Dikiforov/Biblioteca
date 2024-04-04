table 50015 IntervalosPorEdad
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Código Intervalo"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Edad Mínima"; Integer)
        {
            MinValue = 0;
        }
        field(3; "Edad Máxima"; Integer)
        {
            MinValue = 0;
        }
        field(4; "Años Renovación"; Integer)
        {
            MinValue = 0;
        }
        field(5; "No. Serie"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Código Intervalo")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Código Intervalo", "Edad Mínima", "Edad Máxima", "Años Renovación")
        {

        }
    }
    var
        RecSetup: Record "Sales & Receivables Setup";
        NoSerieMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "Código Intervalo" = '' then begin
            RecSetup.Get();
            RecSetup.TestField("Intervalo Edad Nos.");
            NoSerieMgt.InitSeries(RecSetup."Intervalo Edad Nos.", xRec."Código Intervalo", 0D, "Código Intervalo", "No. Serie");
        end;
    end;
}