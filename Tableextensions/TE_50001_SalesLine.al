tableextension 50001 ExtSalesLine extends "Sales Line"
{
    fields
    {
        field(50000; CodLibro; code[10])
        {
            TableRelation = Libros.Codigo;
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
