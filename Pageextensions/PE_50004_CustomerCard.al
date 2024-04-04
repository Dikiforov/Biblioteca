pageextension 50004 ExtCustomerCard extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(SiiActivate; Rec.SiiActivate)
            {
                Caption = 'Código Sii Activado';
                ApplicationArea = All;
            }
        }
    }
}