page 50024 ExpedicionNIF
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Comprobar Expedición NIF';
    layout
    {
        area(Content)
        {
            group(Datos)
            {
                Caption = 'Datos Solicitante';
                field(Pais; CodigoPais)
                {
                    Caption = 'Código País';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = true;
                    TableRelation = "Country/Region";
                    trigger OnValidate()
                    begin
                        EditableFields := true;
                    end;
                }
                field(FechaNacimiento; FechaNacimiento)
                {
                    Caption = 'Fecha Nacimiento (DD/MM/AAAA)';
                    Editable = EditableFields;
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(FechaCaducidad; FechaCaducidad)
                {
                    Caption = 'Fecha Caducidad (DD/MM/AAAA)';
                    Editable = EditableFields;
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(FechaUltimaExpedicion; FechaUltimaExpedicion)
                {
                    Caption = 'Fecha de última emisión';
                    Editable = False;
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Comprobar)
            {
                Caption = 'Comprobar Expedición';
                ApplicationArea = All;
                trigger OnAction()
                var
                    ComprobarDatos: Codeunit ComprobarExpedicionNIF;
                    AnyDate: Date;
                begin
                    //Message(Format(ComprobarDatos.ComprobarExpedicion(CodigoPais, FechaNacimiento, FechaCaducidad)));
                    FechaUltimaExpedicion := ComprobarDatos.ComprobarExpedicion(CodigoPais, FechaNacimiento, FechaCaducidad);
                    /*if (FechaUltimaExpedicion <> AnyDate) then begin
                        FechaCaducidad := AnyDate;
                        FechaNacimiento := AnyDate;
                        CodigoPais := '';
                    end;*/
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        recIntervaloPaises: Record "Intervalos Renovación NIF";
        recIntervaloEdades: Record IntervalosPorEdad;
        IStream: InStream;
    begin
        EditableFields := false;
        //ReadExcelSheet();
        if recIntervaloPaises.IsEmpty() or recIntervaloEdades.IsEmpty() then begin
            // Si hay alguna de las tablas vacías, las inicializaremos
            recIntervaloEdades.DeleteAll();
            recIntervaloPaises.DeleteAll();
            Error('Vuelva a importar los datos mediante: Conf. Paquetes -> DNI -> Importar el fichero "IntervalosEdadUnionEuropea"');
            /*if Confirm('No hay datos de edades en la UE. \¿Desea importarlos?') then begin
                
            end;*/
        end;
    end;

    var
        FechaCaducidad: Date;
        FechaNacimiento: Date;
        EditableFields: Boolean;
        CodigoPais: Code[10];
        FechaUltimaExpedicion: Date;
        BatchName: Code[10];
        FileName: Text[100];
        SheetName: Text[100];

        TempExcelBuffer: Record "Excel Buffer" temporary;

    local procedure ReadExcelSheet()
    var
        FileMgt: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];
    begin
        FromFile := 'IntervalosEdadUnionEuropea.xlsx';
        SheetName := 'Intervalos Renovación NIF';
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IStream, SheetName);
        TempExcelBuffer.ReadSheet();
        Message('Un valor en el temp excel es: %1', TempExcelBuffer);
    end;
}