codeunit 50002 BuscadorFacturasCompras
{
    Permissions = tabledata "Purchase Line" = rm,
    tabledata "Purch. Inv. Line" = rm,
    tabledata "Purch. Rcpt. Header" = rm,
    tabledata "Purchase Header" = rm;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnRunOnBeforeFinalizePosting', '', true, true)]
    local procedure OnRunOnBeforeFinalizePosting(var PurchaseHeader: Record "Purchase Header"; var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchInvHeader: Record "Purch. Inv. Header"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var ReturnShipmentHeader: Record "Return Shipment Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; CommitIsSuppressed: Boolean)
    var
        recLineasFactura: Record "Purch. Inv. Line";
        recAlbaran: Record "Purch. Rcpt. Header";
    begin
        if (PurchaseHeader.Invoice) then begin
            recLineasFactura.SetRange("Document No.", PurchInvHeader."No.");
            if (recLineasFactura.FindFirst()) then begin
                repeat
                    if (recLineasFactura."Receipt No." <> '') then begin
                        if recAlbaran.Get(recLineasFactura."Receipt No.") then begin

                            recAlbaran.CodigoFactura := PurchInvHeader."No.";

                            recAlbaran.FechaFactura := PurchInvHeader."Posting Date";
                        end;
                    end;
                until (recLineasFactura."Receipt No." <> '') or (recLineasFactura.Next() = 0)
            end;

            recAlbaran.Modify();
        end;
    end;

    procedure BuscarLineasDeFacturaxAlbaran(var prmAlbaran: Record "Purch. Rcpt. Header"): Boolean
    var
        recLineasFactura: Record "Purch. Inv. Line";
    begin
        recLineasFactura.SetFilter("Receipt No.", prmAlbaran."No.");

        if (recLineasFactura.FindFirst()) then begin
            prmAlbaran.CodigoFactura := recLineasFactura."Document No.";
            prmAlbaran.FechaFactura := recLineasFactura."Posting Date";
            prmAlbaran.Modify();
        end;
        if (prmAlbaran.CodigoFactura <> '') then
            exit(true);
        exit(false);
    end;

    procedure BuscarFacturaxTextoRegistro(var prmAlbaran: Record "Purch. Rcpt. Header")
    var
        recFactura: Record "Purch. Inv. Header";
    begin
        recFactura.SetFilter("Posting Description", prmAlbaran."Posting Description");
        if (recFactura.FindFirst()) then begin
            prmAlbaran.CodigoFactura := recFactura."No.";
            prmAlbaran.FechaFactura := recFactura."Posting Date";
            prmAlbaran.Modify();
        end;
    end;
}