table 50009 ColaLibros
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; BooksPriceOpen; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum(Libros."Importe PVP");
        }
        field(3; TotalBooks; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Libros);
        }
    }
    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
    var
        Libros: Record Libros;
}