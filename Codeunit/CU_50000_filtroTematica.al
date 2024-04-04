codeunit 50000 "Filtro tematica"
{

    procedure obtenerCodigoInicial(tematica: Enum "Temática Libros"): Code[10];
    var
        enum_aux: Enum "Temática Libros";
        list_aux: List of [Text];
        int_aux: Integer;
        int_aux_2: Integer;
        text_aux: Text;
        Libros: RecordRef;
    begin
        // Obtención de las letras del cod.producto
        list_aux := enum_aux.Names;
        int_aux := tematica.AsInteger();
        if int_aux > 0 then begin
            text_aux := list_aux.Get(int_aux + 1);
            list_aux := text_aux.Split(' ');
            text_aux := list_aux.Get(1).Substring(1, 1);
            if list_aux.Count > 1 then begin
                text_aux := text_aux + list_aux.Get(2).Substring(1, 1);
            end else begin
                text_aux := text_aux + list_aux.Get(1).Substring(2, 1);
            end;
            text_aux := text_aux.ToUpper();
            // Obtención del último valor del cod.producto en el sistema
            int_aux_2 := 1;
            Libros.Open(Database::Libros);
            if not Libros.IsEmpty then begin
                for int_aux := 1 to Libros.Count do begin
                    Libros.Next();
                    if Format(Libros.Field(4)) = Format(tematica) then begin
                        int_aux_2 := int_aux_2 + 1;
                    end;
                end;
            end;
            text_aux := text_aux + '_' + Format(int_aux_2);
            exit(text_aux);
        end else begin
            Error('No es posible poner una temática nula');
        end;
    end;
}