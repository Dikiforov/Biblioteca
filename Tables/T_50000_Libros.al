table 50000 Libros
{
    DataClassification = ToBeClassified;
    Extensible = true;
    fields
    {
        field(1; Codigo; Code[10])
        {
            DataClassification = ToBeClassified;
        }

        field(2; Descripcion; Text[100])
        {
            NotBlank = true;
        }
        field(3; "Descripcion 2"; Text[100])
        {

        }
        field(4; Tematica; Enum "Temática Libros")
        {

        }
        field(5; "Año Publicacion"; Integer)
        {

            MinValue = 0;
            MaxValue = 2024;
            trigger OnValidate()
            var
                recInteger: Integer;
                auxInteger: Integer;
                auxList: List of [Text];
                auxText: Text;
            begin
                recInteger := Rec."Año Publicacion";
                auxList := Format(Today).Split('/');
                auxText := auxList.Get(3);
                Evaluate(auxInteger, auxText);
                Rec.Edad := 2000 + auxInteger - recInteger;
            end;
        }
        field(6; Autor; Code[10])
        {
            TableRelation = Autores.Codigo;
            NotBlank = true;
            trigger OnValidate();
            begin
                rec."Cod. Producto" := rec.Codigo + rec.Autor;
                rec.Modify();
            end;
        }
        field(7; Editorial; Code[10])
        {
            TableRelation = Editoriales.Codigo;
            NotBlank = true;

        }
        field(8; Paginas; Integer)
        {
            MinValue = 1;
            NotBlank = true;
        }
        field(9; "Importe PVP"; Decimal)
        {
            MinValue = 0.00;
            DecimalPlaces = 2;
        }
        field(10; "Cod. Producto"; Code[20])
        {
            Editable = false;
            TableRelation = Item;
        }
        field(11; Edad; Integer)
        {
            Editable = false;
        }
        field(12; "Fecha ult. modificacion"; Date)
        {

        }
        field(13; Usuario; Code[50])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(User."User Name");
        }
        field(14; "Descripcion Producto"; Text[100])
        {

        }
        field(15; "calc Descripcion Producto"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Libros."Descripcion Producto" where(Codigo = field(Codigo)));
            Editable = False;
        }
        field(16; "No. Serie"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = FAlse;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; Codigo)
        {
            Clustered = true;
        }
        key(key1; Autor)
        {
            Enabled = true;
        }
        key(key2; Editorial)
        {
            Enabled = true;
        }
        key(key3; "Cod. Producto")
        {
            Enabled = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Cod. Producto", Descripcion, "Importe PVP")
        {

        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        UserSetup: Record "User Settings";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert();
    var
    begin
        if Codigo = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Libro Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Intervalo Edad Nos.", xRec.Codigo, 0D, Codigo, "No. Serie");
            Rec."Fecha ult. modificacion" := Today;
        end;
    end;
}