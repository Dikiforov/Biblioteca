page 50017 RoleCenterHeadline
{
    PageType = HeadLinePart;

    layout
    {
        area(content)
        {
            field(Headline1; InformacionDiaActual)
            {
                ApplicationArea = All;
            }
            field(Headline2; InformacionLibroMasCaro)
            {
                ApplicationArea = All;
            }
            field(Headline3; InformacionLibroMasExtenso)
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnInit();
    var

    begin
        InformacionDiaActual := Format(Today);
        InformacionLibroMasCaro := ObtenerLibroMasCaro();
        InformacionLibroMasExtenso := ObtenerLibroMasExtenso();
    end;

    local procedure ObtenerLibroMasCaro(): Text
    var
        recLibros: Record Libros;
        iterador_i: Integer;
        valorMaximoLibro: Decimal;
        auxTexto: Text;
    begin
        valorMaximoLibro := 0;
        for iterador_i := 0 to recLibros.Count() do begin
            if (valorMaximoLibro < recLibros."Importe PVP") then begin
                valorMaximoLibro := recLibros."Importe PVP";
                auxTexto := recLibros.Descripcion + ': ' + Format(valorMaximoLibro) + ' USD';
            end;
            recLibros.Next();
        end;
        exit(auxTexto);
    end;

    local procedure ObtenerLibroMasExtenso(): Text
    var
        recLibros: Record Libros;
        iterador_i: Integer;
        valorMaximoLibro: Decimal;
        auxTexto: Text;
    begin
        valorMaximoLibro := 0;
        for iterador_i := 0 to recLibros.Count() do begin
            if (valorMaximoLibro < recLibros.Paginas) then begin
                valorMaximoLibro := recLibros.Paginas;
                auxTexto := recLibros.Descripcion + ': ' + Format(valorMaximoLibro) + ' páginas';
            end;
            recLibros.Next();
        end;
        exit(auxTexto);
    end;

    var
        InformacionDiaActual: Text;
        InformacionLibroMasCaro: Text;
        InformacionLibroMasExtenso: Text;
}