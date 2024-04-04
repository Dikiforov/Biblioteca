table 50006 "Prestamos Libros"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Cod. Libro"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Libros.Codigo;
        }
        field(2; "Num. Prestamo"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            MinValue = 0;
        }
        field(3; "Descripcion Libro"; Text[100])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Libros.Descripcion where(Codigo = field("Cod. Libro")));
        }
        field(4; "Fecha inicio prestamo"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "No. Cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Nombre Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Direccion Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Poblacion Cliente"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Telefono Cliente"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Fecha Fin"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate();
            var
                aux_dias: Integer;
            begin
                aux_dias := rec."Fecha Fin" - rec."Fecha inicio prestamo";
                if aux_dias < 1 then begin
                    Error('Debe de introducir una fecha superior a la de hoy');
                end else begin
                    rec.Dias := aux_dias;
                end;
            end;
        }
        field(11; Dias; Integer)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(12; Precio; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Libros."Importe PVP" where(Codigo = field("Cod. Libro")));
        }
        field(13; Importe; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Num. Prestamo")
        {
            Clustered = true;
        }
        key(key1; "Cod. Libro")
        {

        }
        key(key2; "No. Cliente")
        {

        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
    trigger OnInsert();
    var
    begin
        rec."Fecha inicio prestamo" := Today;
    end;
}