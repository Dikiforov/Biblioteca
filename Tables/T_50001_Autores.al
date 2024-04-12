table 50001 Autores
{
    DataClassification = ToBeClassified;
    Extensible = true;
    fields
    {
        field(1; Codigo; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Nombre; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Apellido1; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Apellido2; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Fecha Nacimiento"; Date)
        {

        }
        field(6; "Número Libros"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Libros where(Autor = field(Codigo), "Año Publicacion" = field("Filtro Año")));
        }
        field(7; "Número Páginas"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = sum(Libros.Paginas where(Autor = field(Codigo), "Año Publicacion" = field("Filtro Año")));
        }
        field(8; "Filtro Año"; Integer)
        {
            FieldClass = FlowFilter;
        }
        field(9; "No. Serie"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = False;
            TableRelation = "No. Series";
        }
        field(10; "% Descuento"; Decimal)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
            MaxValue = 100;
        }
    }
    keys
    {
        key(PK; Codigo)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Codigo, Nombre, Apellido1)
        {

        }
    }
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert();
    var
    begin
        if Codigo = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Autor Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Autor Nos.", xRec.Codigo, 0D, Codigo, "No. Serie");
        end;
    end;
}