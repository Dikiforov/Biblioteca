table 50010 ColaAutores
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; TotalAutores; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Autores);
        }
        field(3; TotalPaginas; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = sum(Autores."Número Páginas");
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
        Autores: Record Autores;

}