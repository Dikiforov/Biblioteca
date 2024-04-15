codeunit 50009 ofertaAutor
{

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'CodLibro', true, true)]
    local procedure OnAfterValidateEventCodLibro(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    var
    begin
        //ModificarValoresPrecios(Rec);
    end;

    local procedure ModificarValoresPrecios(var prmSalesLine: Record "Sales Line")
    var
        recCustomer: Record Customer;
        recAutores: Record Autores;
        recLibros: Record Libros;
        valorTotal: decimal;
    begin
        // Aplicamos el precio de venta unitario
        recLibros.SetFilter(Codigo, prmSalesLine.CodLibro);
        if (recLibros.FindFirst()) then begin
            prmSalesLine."Unit Price" := recLibros."Importe PVP";
        end;
        // Aplicamos el descuento si el cliente es un autor
        recCustomer.SetFilter("No.", prmSalesLine."Sell-to Customer No.");
        if (recCustomer.FindFirst()) then begin
            if (recCustomer.AutorAsociado <> '') then begin
                recAutores.SetFilter(Codigo, recCustomer.AutorAsociado);
                if (recAutores.FindFirst()) then begin
                    prmSalesLine."Line Discount %" := recAutores."% Descuento";
                    valorTotal := ((100 - prmSalesLine."Line Discount %") / 100) * prmSalesLine."Unit Price";
                    prmSalesLine.Amount := valorTotal;
                end;
            end;
        end;
    end;
    /*
    trigger OnValidate()
                var
                    recLibros: Record Libros;
                    recAutor: Record Autores;
                begin
                    recLibros.SetFilter(Codigo, rec.CodLibro);
                    if (recLibros.FindFirst()) then begin
                        rec.Description := recLibros.Descripcion;
                        rec."Unit Price" := recLibros."Importe PVP";
                        rec.CodAutor := recLibros.Autor;
                        rec.CodEditorial := recLibros.Editorial;
                        recAutor.SetFilter(Codigo, rec.CodAutor);
                        if (recAutor.FindFirst()) then begin
                            rec."Line Discount %" := recAutor."% Descuento";
                        end;
                    end;
                end;
    */
}