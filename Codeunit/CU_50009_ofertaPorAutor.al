codeunit 50009 ofertaAutor
{

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'CodLibro', true, true)]
    local procedure OnAfterValidateEventCodLibro(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    var
        SalesLineRecord: Record "Sales Line";
        CustomerRecord: Record Customer;
        AuthorRecord: Record Autores;
    begin
        repeat
            // Comprobamos si es de tipo item las lineas
            if (SalesLineRecord.Type = SalesLineRecord.Type::Item) then begin
                if (SalesLineRecord.CodLibro <> '') then begin
                    CustomerRecord.SetRange("No.", Rec."Sell-to Customer No.");
                    if (CustomerRecord.FindFirst()) then begin
                        AuthorRecord.SetRange(Codigo, CustomerRecord.AutorAsociado);
                        if (AuthorRecord.FindFirst()) then begin
                            SalesLineRecord."Line Discount %" := AuthorRecord."% Descuento";
                            Message('El cliente ' + CustomerRecord.Name + ' es autor y compra el libro ' + SalesLineRecord.CodLibro);
                            Message('Descuento en linea: ' + Format(SalesLineRecord."Line Discount %") + ' Descuento autor: ' + Format(AuthorRecord."% Descuento"));
                            SalesLineRecord.Modify();
                        end;
                    end;
                end;
            end;
        until (SalesLineRecord.Next() = 0);
        SalesLineRecord.Modify();
    end;
}