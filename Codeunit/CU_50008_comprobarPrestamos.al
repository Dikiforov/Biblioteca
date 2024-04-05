codeunit 50008 "Comprobar Prestamos"
{
    trigger OnRun()
    begin

    end;

    procedure actualizarPrestamos(recPrestamos: Record "Prestamos Libros"; var recInfoBiblioteca: Record InformacionBiblioteca)
    var
        contadorActivos: Integer;
        contadorVencidos: Integer;
        fechaNula: Date;
    begin
        contadorActivos := 0;
        contadorVencidos := 0;
        repeat
            if (recPrestamos."Fecha Fin" <> fechaNula) then begin
                if (recPrestamos."Fecha Fin" >= Today) then begin
                    contadorActivos := contadorActivos + 1;
                end else begin
                    contadorVencidos := contadorVencidos + 1;
                end;
            end;
        until recPrestamos.Next() = 0;
        recInfoBiblioteca.PrestamosActivos := contadorActivos;
        recInfoBiblioteca.PrestamosVencidos := contadorVencidos;
        recInfoBiblioteca.Modify();
    end;

    procedure actualizarColorColas(var recInfoBiblioteca: Record InformacionBiblioteca): Text[50]
    var
    begin
        if recInfoBiblioteca.Get() then begin
            if (recInfoBiblioteca.PrestamosVencidos > 0) then begin
                exit('Unfavorable');
            end;
        end;
        exit('favorable');
    end;
}