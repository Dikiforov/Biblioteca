codeunit 50001 ContadorSubscriber
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Table, Database::Editoriales, 'OnAfterValidateEvent', 'Autor', true, true)]
    procedure OnAfterValidateEvent(Rec: Record Editoriales; xRec: Record Editoriales; CurrFieldNo: Integer)
    var
        Libros: RecordRef;
        totalLibros: Integer;
        totalPaginas: Integer;
        iterador: Integer;
        aux_text: text;
        aux_integer: integer;
    begin
        totalLibros := 0;
        totalPaginas := 0;
        Libros.Open(Database::Libros);
        for iterador := 0 to Libros.Count do begin
            if ((Format(Libros.Field(6).Value) = rec.Autor) and (Format(Libros.Field(7).Value) = rec.Codigo)) then begin
                totalLibros += 1;
                aux_text := Format(Libros.Field(8).Value);
                Evaluate(aux_integer, aux_text);
                totalPaginas += aux_integer;
            end;
            Libros.Next();
        end;
        rec."Libros Autor Editorial" := totalLibros;
        rec."Número Páginas Autor" := totalPaginas;
        rec.Modify();
    end;
}