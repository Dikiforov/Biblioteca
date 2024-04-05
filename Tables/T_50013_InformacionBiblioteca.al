table 50013 InformacionBiblioteca
{
    Caption = 'Activities Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; TotalLibros; Integer)
        {
            CalcFormula = count(Libros);
            FieldClass = FlowField;
        }
        field(3; TotalAutores; Integer)
        {
            CalcFormula = count(Autores);
            FieldClass = FlowField;
        }
        field(4; TotalEditoriales; Integer)
        {
            CalcFormula = count(Editoriales);
            FieldClass = FlowField;
        }
        field(5; TotalPrestamos; Integer)
        {
            CalcFormula = count("Prestamos Libros");
            FieldClass = FlowField;
        }
        field(6; TotalPrecioLibros; Decimal)
        {
            CalcFormula = sum(Libros."Importe PVP");
            FieldClass = FlowField;
        }
        field(7; TotalPaginasLibros; Integer)
        {
            CalcFormula = sum(Libros.Paginas);
            FieldClass = FlowField;
        }
        field(8; PrestamosActivos; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; PrestamosVencidos; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}