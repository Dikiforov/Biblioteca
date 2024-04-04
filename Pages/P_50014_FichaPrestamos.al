page 50014 FichaPrestamos
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Prestamos Libros";

    layout
    {
        area(Content)
        {
            group("Ficha prestamos")
            {
                field("Cod. Libro"; Rec."Cod. Libro")
                {
                    ApplicationArea = All;
                }
                field("Num. Prestamo"; Rec."Num. Prestamo")
                {
                    ApplicationArea = All;
                }
                field("Descripcion Libro"; Rec."Descripcion Libro")
                {
                    ApplicationArea = All;
                }
                field("Fecha inicio prestamo"; Rec."Fecha inicio prestamo")
                {
                    ApplicationArea = All;
                }
                field("No. Cliente"; Rec."No. Cliente")
                {
                    ApplicationArea = All;
                }
                field("Nombre Cliente"; Rec."Nombre Cliente")
                {
                    ApplicationArea = All;
                }
                field("Direccion Cliente"; Rec."Direccion Cliente")
                {
                    ApplicationArea = All;
                }
                field("Poblacion Cliente"; Rec."Poblacion Cliente")
                {
                    ApplicationArea = All;
                }
                field("Telefono Cliente"; Rec."Telefono Cliente")
                {
                    ApplicationArea = All;
                }
                field("Fecha Fin"; Rec."Fecha Fin")
                {
                    ApplicationArea = All;
                }
                field(Dias; Rec.Dias)
                {
                    ApplicationArea = All;
                }
                field(Precio; Rec.Precio)
                {
                    ApplicationArea = All;
                }
                field(Importe; Rec.Importe)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}