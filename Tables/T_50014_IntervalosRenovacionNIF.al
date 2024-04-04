table 50014 "Intervalos Renovación NIF"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CodPais; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(2; Intervalo_1; Code[10])
        {
            TableRelation = IntervalosPorEdad;
        }
        field(3; Intervalo_2; Code[10])
        {
            TableRelation = IntervalosPorEdad;
        }
        field(4; Intervalo_3; Code[10])
        {
            TableRelation = IntervalosPorEdad;
        }
        field(5; Intervalo_4; Code[10])
        {
            TableRelation = IntervalosPorEdad;
        }
    }

    keys
    {
        key(Key1; CodPais)
        {
            Clustered = true;
        }
    }
}