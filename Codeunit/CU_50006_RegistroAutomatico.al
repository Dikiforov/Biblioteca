codeunit 50006 "Registro Automático"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmPost', '', false, false)]
    local procedure OnBeforeConfirmPost(var SalesHeader: Record "Sales Header"; var DefaultOption: Integer; var Result: Boolean; var IsHandled: Boolean)
    var
        lrecSalesReceivablesSetup: Record "Sales & Receivables Setup";
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            lrecSalesReceivablesSetup.FindFirst();
            DefaultOption := lrecSalesReceivablesSetup."Tipo de Facturación Automática".AsInteger();
            case DefaultOption of
                0:
                    begin
                        IsHandled := false;
                        Result := true;
                    end;

                1:
                    begin
                        if confirm('Generar Albarán del pedido %1 ?', true, SalesHeader."No.") then begin
                            result := true;
                            SalesHeader.Ship := true;
                            SalesHeader.Invoice := false;
                            IsHandled := true;
                        end else begin
                            error('Cancelado');
                        end;
                    end;

                else begin
                    if confirm('Generar Albarán y Factura del pedido %1 ?', true, SalesHeader."No.") then begin
                        result := true;
                        SalesHeader.Ship := true;
                        SalesHeader.Invoice := true;
                        IsHandled := true;
                    end else begin
                        error('Cancelado');
                    end;
                end;
            end;
        end;
    end;
}