codeunit 50005 ComprobarExpedicionNIF
{
    var
        recRenovacion: Record "Intervalos Renovación NIF";
        recEdades: Record IntervalosPorEdad;

    procedure ComprobarExpedicion(CodPais: Code[10]; FechaNacimiento: Date; FechaCaducidad: Date): Date
    var

    begin
        if FechaNacimiento > Today then begin
            Error('La fecha de nacimiento es superior al día de hoy %1', Format(Today));
        end else begin
            if (FechaCaducidad < FechaNacimiento) then begin
                Error('La fecha de caducidad es inferior a la de nacimiento');
            end else begin
                if (FechaCaducidad < Today) then begin
                    if (Confirm('El documento de identidad esta caducado, ¿quiere seguir con el cálculo?')) then begin
                        if (recRenovacion.Get(CodPais)) then begin
                            exit(ObtenerFechaUltRenovacionPais(recRenovacion, FechaNacimiento, FechaCaducidad));
                        end else begin
                            Error('El país no esta en la UE');
                        end;
                    end;
                end else begin
                    if (recRenovacion.Get(CodPais)) then begin
                        exit(ObtenerFechaUltRenovacionPais(recRenovacion, FechaNacimiento, FechaCaducidad));
                    end else begin
                        Error('El país no esta en la UE');
                    end;
                end;
            end
        end;
    end;

    // Funciones lógica última expedición
    local procedure ObtenerFechaUltRenovacionPais(RecPais: Record "Intervalos Renovación NIF"; FechaNacimiento: Date; FechaCaducidad: Date): Date
    var
        codigoIntervaloActual: Code[10];
        codigoIntervaloSiguiente: Code[10];
    begin
        codigoIntervaloActual := ObtenerIntervaloEdadActual(RecPais.Intervalo_4, ObtenerEdad(FechaCaducidad, FechaNacimiento));
        if (codigoIntervaloActual <> '') then begin
            codigoIntervaloSiguiente := RecPais.Intervalo_3;
            exit(CalcularFecha(codigoIntervaloActual, codigoIntervaloSiguiente, FechaNacimiento, FechaCaducidad));
        end;

        codigoIntervaloActual := ObtenerIntervaloEdadActual(RecPais.Intervalo_3, ObtenerEdad(FechaCaducidad, FechaNacimiento));
        if (codigoIntervaloActual <> '') then begin
            codigoIntervaloSiguiente := RecPais.Intervalo_2;
            exit(CalcularFecha(codigoIntervaloActual, codigoIntervaloSiguiente, FechaNacimiento, FechaCaducidad));
        end;

        codigoIntervaloActual := ObtenerIntervaloEdadActual(RecPais.Intervalo_2, ObtenerEdad(FechaCaducidad, FechaNacimiento));
        if (codigoIntervaloActual <> '') then begin
            codigoIntervaloSiguiente := RecPais.Intervalo_1;
            exit(CalcularFecha(codigoIntervaloActual, codigoIntervaloSiguiente, FechaNacimiento, FechaCaducidad));
        end;

        codigoIntervaloActual := ObtenerIntervaloEdadActual(RecPais.Intervalo_1, ObtenerEdad(FechaCaducidad, FechaNacimiento));
        if (codigoIntervaloActual <> '') then begin
            codigoIntervaloSiguiente := '';
            exit(CalcularFecha(codigoIntervaloActual, codigoIntervaloSiguiente, FechaNacimiento, FechaCaducidad));
        end;
        Message('El usuario no tiene obligación de tener carnet de identidad');
    end;

    local procedure CalcularFecha(IntervaloActual: Code[10]; IntervaloSiguiente: Code[10]; FechaNacimiento: Date; FechaCaducidad: Date): Date
    var
        RenovacionActual: Integer;
        RenovacionAnterior: Integer;
        ultimoAño: Integer;
        returnDate: Date;
        anyDate: Date;
    begin
        RenovacionAnterior := 0;
        RenovacionActual := 0;
        if (IntervaloSiguiente <> '') then begin
            // Primero obtenemos el año anterior de renovación
            recEdades.Get(IntervaloSiguiente);
            RenovacionAnterior := recEdades."Años Renovación";
        end;
        // Ahora obtenemos el año actual de renovación
        recEdades.Get(IntervaloActual);
        RenovacionActual := recEdades."Años Renovación";
        "ultimoAño" := Date2DMY(FechaCaducidad, 3) - RenovacionActual;
        // Esto significa que el intervalo actual no es válido, por tanto, será el anterior intervalo
        if ((ObtenerEdad(FechaCaducidad, FechaNacimiento) - RenovacionActual) < recEdades."Edad Mínima") then begin
            if (RenovacionAnterior = 0) then begin
                Error('En base a los intervalos del país, la fecha de caducidad no es válida para la fecha de nacimiento');
            end;
            "ultimoAño" := Date2DMY(FechaCaducidad, 3) - RenovacionAnterior;
        end;
        if (RenovacionActual = 0) and (Date2DMY(FechaCaducidad, 3) = 9999) then begin
            // En caso de que sea indefinido, contemplamos la opción de que se lo renovo con el intervalo anterior
            "ultimoAño" := Date2DMY(FechaNacimiento, 3) + recEdades."Edad Mínima";
            returnDate := DMY2Date(Date2DMY(FechaNacimiento, 1), Date2DMY(FechaNacimiento, 2), "ultimoAño");
        end else begin
            if (RenovacionActual = 0) then begin
                "ultimoAño" := Date2DMY(FechaCaducidad, 3) - RenovacionAnterior;
                returnDate := DMY2Date(Date2DMY(FechaCaducidad, 1), Date2DMY(FechaCaducidad, 2), "ultimoAño");
            end else begin
                returnDate := DMY2Date(Date2DMY(FechaCaducidad, 1), Date2DMY(FechaCaducidad, 2), "ultimoAño");
            end;
        end;

        if (returnDate = anyDate) then
            Error('La edad mínima es de %1 y el usuario tiene: %2', recEdades."Edad Mínima", ObtenerEdad(today, FechaNacimiento));
        exit(returnDate);
    end;

    local procedure ObtenerIntervaloEdadActual(CodIntervaloPais: Code[10]; EdadCaducidad: Integer): Code[10]
    var
        auxRecIntervaloEdades: Record IntervalosPorEdad;
        returnValue: Code[10];
    begin
        returnValue := '';
        if (auxRecIntervaloEdades.Get(CodIntervaloPais)) then begin
            if (ComprobarEdades(auxRecIntervaloEdades, EdadCaducidad)) then begin
                returnValue := auxRecIntervaloEdades."Código Intervalo";
            end;
        end;
        exit(returnValue);
    end;

    // Funciones auxiliares
    local procedure ObtenerEdad(FechaDestino: Date; FechaOrigen: Date): Integer
    var
        totDias: Integer;
        totMeses: Integer;
        totAnios: Integer;
    begin
        totDias := Date2DMY(FechaDestino, 1) - Date2DMY(FechaOrigen, 1);
        totMeses := Date2DMY(FechaDestino, 2) - Date2DMY(FechaOrigen, 2);
        totAnios := Date2DMY(FechaDestino, 3) - Date2DMY(FechaOrigen, 3);
        if (totDias < 0) or (totMeses < 0) then
            totAnios := totAnios - 1;
        exit(totAnios);
    end;

    local procedure ComprobarEdades(RecordIntervaloEdades: Record IntervalosPorEdad; actEdad: Integer): Boolean
    begin
        if (RecordIntervaloEdades."Edad Mínima" <= actEdad) and (actEdad < RecordIntervaloEdades."Edad Máxima") then
            exit(true);
        exit(false);
    end;
}