table 50003 Editoriales
{
    DataClassification = ToBeClassified;
    Extensible = true;

    fields
    {
        field(1; Codigo; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Nombre; Text[50])
        {

        }
        field(3; Correo; Text[50])
        {

        }
        field(4; "No. Serie"; Code[20])
        {
            Editable = false;
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5; Autor; Code[10])
        {
            TableRelation = Autores.Codigo;
        }
        field(6; "Número Páginas Autor"; Integer)
        {
            MinValue = 0;
            Editable = False;
        }
        field(7; "Libros Autor Editorial"; Integer)
        {
            MinValue = 0;
            Editable = False;
        }
        field(8; "Filtro Autor"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Autores.Codigo;
        }
        field(9; "Filtro Paginas Autos"; Integer)
        {
            MinValue = 0;
            CalcFormula = sum(Libros.Paginas where(Autor = field("Filtro Autor"), Editorial = field(Codigo)));
            FieldClass = FlowField;
        }
        field(10; "Filtro Total Libros"; Integer)
        {
            MinValue = 0;
            CalcFormula = count(Libros where(Autor = field("Filtro Autor"), Editorial = field(Codigo)));
            FieldClass = FlowField;
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
        fieldgroup(DropDown; Codigo, Nombre)
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
            SalesSetup.TestField("Editorial Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Editorial Nos.", xRec.Codigo, 0D, Codigo, "No. Serie");
        end;
    end;
}