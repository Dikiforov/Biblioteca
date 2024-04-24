tableextension 50001 ExtSalesLine extends "Sales Line"
{
    fields
    {
        field(50000; CodLibro; code[10])
        {
            TableRelation = Libros.Codigo;
            trigger OnValidate()
            var
                recCustomer: Record Customer;
                recAutores: Record Autores;
                recLibros: Record Libros;
                DocumentTotals: Codeunit "Document Totals";
            begin
                recLibros.SetFilter(Codigo, CodLibro);
                if (recLibros.FindFirst()) then begin
                    CodAutor := recLibros.Autor;
                    CodEditorial := recLibros.Editorial;

                    recCustomer.SetFilter("No.", "Sell-to Customer No.");
                    if (recCustomer.FindFirst()) then begin
                        recAutores.SetFilter(Codigo, recCustomer.AutorAsociado);
                        if (recAutores.FindFirst()) then begin
                            Rec."Unit Price" := recLibros."Importe PVP";
                            Rec."Line Discount %" := recAutores."% Descuento";
                            Rec."Line Discount Calculation" := "Line Discount Calculation"::"%";
                            Rec.UpdateAmounts();
                        end;
                    end;
                end;
            end;
        }
        field(50001; CodAutor; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; CodEditorial; code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
}
