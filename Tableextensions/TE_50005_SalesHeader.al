tableextension 50005 ExtSalesHeader extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; CodSii; Code[20])
        {

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
}