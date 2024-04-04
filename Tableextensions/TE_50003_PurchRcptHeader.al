tableextension 50003 ExtPostedPurchaseReceipts extends "Purch. Rcpt. Header"
{
    fields
    {
        /*field(50000; CodigoFactura; Code[20])
        {
            CalcFormula = lookup("Purch. Inv. Line"."Receipt No." where("Receipt No." = field("No.")));
            FieldClass = FlowField;
        }
        field(50001; FechaFactura; Date)
        {
            CalcFormula = lookup("Purch. Inv. Line"."Posting Date" where("Receipt No." = field("No.")));
            FieldClass = FlowField;
        }*/
        field(50000; CodigoFactura; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purch. Inv. Header";
        }
        field(50001; FechaFactura; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
}