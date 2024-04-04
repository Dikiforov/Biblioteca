tableextension 50004 ExtCustomer extends Customer
{
    fields
    {
        field(50000; CodSii; Code[20])
        {

        }
        field(50001; "No. Serie"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = False;
            TableRelation = "No. Series";
        }
        field(50002; SiiActivate; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}