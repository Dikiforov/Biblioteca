pageextension 50006 ExtSalesOrder extends "Sales Order"
{
    layout
    {
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            begin

            end;
        }
        // Add changes to page layout here
        addlast(General)
        {
            field(CodSii; Rec.CodSii)
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }
}