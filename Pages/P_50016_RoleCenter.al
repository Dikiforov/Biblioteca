page 50016 Biblioteca
{
    PageType = RoleCenter;
    Caption = 'Biblioteca';
    layout
    {
        area(RoleCenter)
        {
            part(Headline; RoleCenterHeadline)
            {
                ApplicationArea = All;
            }
            part(Activities; InformacionBiblioteca)
            {
                ApplicationArea = All;
            }
            group("Lista de datos")
            {

                part("Lista de libros"; "Lista Libros Part")
                {
                    Editable = false;
                    Caption = 'Lista de libros';
                    ApplicationArea = All;
                }
                part("Lista de autores"; "Lista Autores Part")
                {
                    Editable = false;
                    Caption = 'Lista de autores';
                    ApplicationArea = All;
                }
                part("Lista de editoriales"; "Lista Editoriales Part")
                {
                    Editable = false;
                    Caption = 'Lista de editoriales';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group("Gestión")
            {
                Caption = 'Gestión Biblioteca';
                Image = Administration;
                action("Listar libros")
                {
                    Caption = 'Listar libros';
                    RunObject = Page "Lista Libros";
                    ApplicationArea = All;
                }
                action("Listar autores")
                {
                    Caption = 'Listar autores';
                    RunObject = Page "Lista Autores";
                    ApplicationArea = All;
                }
                action("Listar editoriales")
                {
                    Caption = 'Listar editoriales';
                    RunObject = Page "Lista Editoriales";
                    ApplicationArea = All;
                }
                action("Listar Prestamos")
                {
                    Caption = 'Listar préstamos';
                    ApplicationArea = All;
                    RunObject = Page "Lista Prestamos";
                }
            }

            group(Ventas)
            {
                Caption = 'Ventas';
                Image = Sales;
                action("Pedidos venta")
                {
                    Caption = 'Pedidos venta';
                    ApplicationArea = All;
                    RunObject = Page "Sales Order List";
                }
                action("Facturas venta")
                {
                    Caption = 'Facturas venta';
                    ApplicationArea = All;
                    RunObject = Page "Sales Invoice List";
                }
                action("Historico albaranes venta")
                {
                    Caption = 'Histórico albaranes venta';
                    ApplicationArea = All;
                    RunObject = Page "Posted Sales Shipments";
                }
                action("Historico facturas ventas")
                {
                    Caption = 'Histórico facturas venta';
                    ApplicationArea = All;
                    RunObject = Page "Posted Sales Invoices";
                }
            }

            group(Compras)
            {
                Caption = 'Compras';
                Image = Purchasing;
                action("Histórico facturas compra")
                {
                    Caption = 'Histórico facturas compra';
                    ApplicationArea = All;
                    RunObject = Page "Posted Purchase Invoices";
                }
                action("Histórico albaranes compra")
                {
                    Caption = 'Histórico albaranes compra';
                    ApplicationArea = All;
                    RunObject = Page "Posted Purchase Receipts";
                }
                action("Facturas de compra")
                {
                    Caption = 'Facturas compra';
                    ApplicationArea = All;
                    RunObject = Page "Posted Purchase Receipts";
                }
            }
        }

        area(Embedding)
        {
            action("ListarLibros")
            {
                Caption = 'Lista libros';
                ApplicationArea = All;
                RunObject = Page "Lista Libros";
            }
            action("ListaAutores")
            {
                Caption = 'Lista autores';
                ApplicationArea = All;
                RunObject = Page "Lista Autores";
            }
            action("ListaEditoriales")
            {
                Caption = 'Lista editoriales';
                ApplicationArea = All;
                RunObject = Page "Lista Editoriales";
            }
            action("ListaPrestamos")
            {
                Caption = 'Lista préstamos';
                ApplicationArea = All;
                RunObject = Page "Lista Prestamos";
            }
        }

        area(Processing)
        {
            action(ListaIntervalosPais)
            {
                Caption = 'Listar intervalos por país';
                Image = Action;
                ApplicationArea = All;
                RunObject = Page ListaIntervalosPais;
                RunPageMode = View;
            }
            action(ListaIntervalosEdad)
            {
                Caption = 'Lista intervalos por edad';
                Image = Action;
                ApplicationArea = All;
                RunObject = Page ListaIntervalosEdad;
                RunPageMode = View;
            }
            action(ComprobarNIF)
            {
                Caption = 'Comprobar NIF';
                ApplicationArea = All;
                RunObject = Page ExpedicionNIF;
                RunPageMode = Edit;
            }
        }

        area(Reporting)
        {
            action(ReportingAction)
            {
                Caption = 'Reporting 1';
                Image = Report;
                ApplicationArea = All;
            }
        }
    }
}