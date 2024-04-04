tableextension 50002 ExtSalesShipmentHeader extends "Sales Shipment Header"
{
    fields
    {
        field(50000; CodigoFactura; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sales Invoice Header";
        }
        field(50001; FechaFactura; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
}