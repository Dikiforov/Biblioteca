page 50003 "Lista Autores"
{
    PageType = List;
    UsageCategory = Lists;
    SourceTable = Autores;
    CardPageId = "Ficha Autores";
    ModifyAllowed = false;
    layout
    {
        area(Content)
        {
            repeater("Lista Autores")
            {
                field(Codigo; Rec.Codigo)
                {
                    ApplicationArea = All;
                }
                field(Nombre; Rec.Nombre)
                {
                    ApplicationArea = All;
                }
                field("Primer Appelido"; Rec.Apellido1)
                {
                    ApplicationArea = All;
                }
                field("Segundo Apellido"; Rec.Apellido2)
                {
                    ApplicationArea = All;
                }
                field("Fecha Nacimiento"; Rec."Fecha Nacimiento")
                {
                    ApplicationArea = All;
                }
                field("Número Libros"; Rec."Número Libros")
                {
                    ApplicationArea = All;
                }
                field("Número Páginas"; Rec."Número Páginas")
                {
                    ApplicationArea = All;
                }
                field("Filtro Año"; Rec."Filtro Año")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}