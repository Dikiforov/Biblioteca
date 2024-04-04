pageextension 50005 ExtPostedSalesShipmentS extends "Posted Sales Shipments"
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
    var
        anyDate: Date;
    begin
        if (Rec.CodigoFactura = '') then begin
            // Comprobamos primero para las facturas que se han hecho de manera directa
            if not (cduGestionVentas.BuscarLineasDeFacturaxAlbaran(Rec)) then begin
                // Comprobamos para las facturas que contengan varios albaranes
                cduGestionVentas.BuscarFacturaxTextoRegistro(Rec);
            end;
        end;
    end;

    var

        cduGestionVentas: Codeunit BuscadorFacturasVenta;
}