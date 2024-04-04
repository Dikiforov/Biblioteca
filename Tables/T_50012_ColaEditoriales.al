table 50012 ColaEditoriales
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; TotalEditoriales; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Editoriales);
        }

    }

    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        Editoriales: Record Editoriales;
}