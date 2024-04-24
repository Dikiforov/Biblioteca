codeunit 50007 "Inf. Cliente Venta Fact. Venta"
{
    Permissions =
        tabledata "Sales Shipment Line" = rm,
        tabledata "Sales Shipment Header" = rm,
        tabledata "Sales Header" = rm,
        tabledata "Sales Line" = rm;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Get Shipment", 'OnAfterInsertLine', '', true, true)]
    local procedure OnAfterInsertLine(var SalesShptLine: Record "Sales Shipment Line"; var SalesLine: Record "Sales Line"; SalesShptLine2: Record "Sales Shipment Line"; TransferLine: Boolean; var SalesHeader: Record "Sales Header")
    var
        SalesLineMoreInfo: Record "Sales Line";
        NextLineNo: Integer;
    begin
        if TransferLine then begin
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange(Type, SalesLine.Type::" ");
            if SalesLine.FindFirst() then begin
                repeat
                    if SalesLine.Description.Contains('Shipment') then begin
                        NextLineNo := SalesLine."Line No." - 1;
                        InsertInfoSalesLine(true, SalesHeader, SalesLine, NextLineNo);
                        NextLineNo := NextLineNo - 1;
                        InsertInfoSalesLine(false, SalesHeader, SalesLine, NextLineNo);
                        NextLineNo := NextLineNo - 1;
                    end;
                until SalesLine.Next() = 0;
            end;
        end;
    end;

    local procedure InsertInfoSalesLine(campoInsertado: Boolean; SalesHeader: Record "Sales Header"; SalesLineNew: Record "Sales Line"; newLineNo: Integer)
    var
    begin
        SalesLineNew.Init();
        SalesLineNew."Line No." := newLineNo;
        SalesLineNew."Document Type" := SalesHeader."Document Type";
        SalesLineNew."Document No." := SalesHeader."No.";
        if campoInsertado then
            SalesLineNew.Description := 'Venta a: ' + SalesHeader."Sell-to Customer Name"
        else
            SalesLineNew.Description := 'Fecha registro: ' + Format(SalesHeader."Posting Date");

        if not SalesLineNew.Insert() then begin
            SalesLineNew.Modify();
        end;
    end;
}