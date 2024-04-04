pageextension 50003 ExtPostedPurchaseReceipts extends "Posted Purchase Receipts"
{
    layout
    {
        addlast(Control1)
        {
            field(CodFactura; Rec.CodigoFactura)
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field(FechaFactura; Rec.FechaFactura)
            {
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if (Rec.CodigoFactura = '') then begin
            // Comprobamos primero para las facturas que se han hecho de manera directa
            if not (cduGestionCompras.BuscarLineasDeFacturaxAlbaran(Rec)) then begin
                // Comprobamos para las facturas que contengan varios albaranes
                cduGestionCompras.BuscarFacturaxTextoRegistro(Rec);
            end;
        end;
    end;

    var
        cduGestionCompras: Codeunit BuscadorFacturasCompras;
}