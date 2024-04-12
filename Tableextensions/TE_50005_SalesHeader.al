tableextension 50005 ExtSalesHeader extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; CodSii; Code[20])
        {

        }
        field(50001; EsAutor; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        modify("Bill-to Customer No.")
        {
            trigger OnAfterValidate()
            begin
                comprobarAutor();
            end;
        }
        modify("Bill-to Name")
        {
            trigger OnAfterValidate()
            begin
                comprobarAutor();
            end;
        }
    }

    var
        recCustomer: Record Customer;
        recSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert();
    var
        recSalesOrder: Record "Sales Header";
    begin
        if recCustomer.SiiActivate then begin
            recSetup.Get();
            recSetup.TestField("Código SII");
            NoSeriesMgt.InitSeries(recSetup."Código SII", xRec.CodSii, 0D, CodSii, "No. Series");
            recSalesOrder.CodSii := rec.CodSii;
        end;
    end;

    local procedure comprobarAutor()
    var
        recCustomer: Record Customer;
        recAutores: Record Autores;
    begin
        Rec.EsAutor := false;
        recCustomer.SetRange("No.", Rec."Sell-to Customer No.");
        if recCustomer.FindFirst() then begin
            if (recCustomer.AutorAsociado <> '') then begin
                Rec.EsAutor := true;
            end;
        end;
    end;
}