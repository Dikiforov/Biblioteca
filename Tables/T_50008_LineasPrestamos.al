table 50008 "Lineas Prestamos"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Codigo Prestamos"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Num. Linea"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Descripcion Libro"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Fecha inicio Prestamo"; Date)
        {
            DataClassification = ToBeClassified;
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
        field(10; "Fecha fin"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Dias; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Precio; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Importe; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Cod. Libro"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Codigo Prestamos")
        {
            Clustered = true;
        }
        key(key1; "No. Cliente")
        {

        }
        key(key2; "Cod. Libro")
        {

        }
    }
}