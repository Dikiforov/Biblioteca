codeunit 50004 BuscadorFacturasVenta
{
    Permissions = tabledata "Sales Invoice Line" = rm,
    tabledata "Sales Cr.Memo Line" = rm,
    tabledata "Sales Shipment Line" = rm,
    tabledata "Sales Shipment Header" = rm;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnRunOnBeforeFinalizePosting', '', true, true)]
    local procedure OnRunOnBeforeFinalizePosting(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; CommitIsSuppressed: Boolean; GenJnlLineExtDocNo: Code[35]; var EverythingInvoiced: Boolean; GenJnlLineDocNo: Code[20]; SrcCode: Code[10])
    var
        recLineasFactura: Record "Sales Invoice Line";
        recAlbaran: Record "Sales Shipment Header";
    begin
        if (SalesHeader.Invoice) then begin
            recLineasFactura.SetRange("Document No.", SalesInvoiceHeader."No.");
            if (recLineasFactura.FindFirst()) then begin
                repeat
                    if (recLineasFactura."Shipment No." <> '') then begin
                        if recAlbaran.Get(recLineasFactura."Shipment No.") then begin

                            recAlbaran.CodigoFactura := SalesInvoiceHeader."No.";

                            recAlbaran.FechaFactura := SalesInvoiceHeader."Posting Date";
                        end;
                    end;
                until (recLineasFactura."Shipment No." <> '') or (recLineasFactura.Next() = 0)
            end;

            recAlbaran.Modify();
        end;
    end;

    procedure BuscarLineasDeFacturaxAlbaran(var prmAlbaran: Record "Sales Shipment Header"): Boolean
    var
        recLineasFactura: Record "Sales Invoice Line";
    begin
        recLineasFactura.SetFilter("Shipment No.", prmAlbaran."No.");

        if (recLineasFactura.FindFirst()) then begin
            prmAlbaran.CodigoFactura := recLineasFactura."Document No.";
            prmAlbaran.FechaFactura := recLineasFactura."Posting Date";
            prmAlbaran.Modify();
        end;
        if (prmAlbaran.CodigoFactura <> '') then
            exit(true);
        exit(false);
    end;

    procedure BuscarFacturaxTextoRegistro(var prmAlbaran: Record "Sales Shipment Header")
    var
        recFactura: Record "Sales Invoice Header";
    begin
        recFactura.SetFilter("Posting Description", prmAlbaran."Posting Description");
        if (recFactura.FindFirst()) then begin
            prmAlbaran.CodigoFactura := recFactura."No.";
            prmAlbaran.FechaFactura := recFactura."Posting Date";
            prmAlbaran.Modify();
        end;
    end;
}