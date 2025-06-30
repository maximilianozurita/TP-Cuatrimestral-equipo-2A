<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container my-5">
        <h2 class="text-center mb-4">Carrito de Compras</h2>

        <asp:Panel ID="pnlFiltros" runat="server" CssClass="card p-3 shadow-sm mb-4">
            <div class="row g-3 align-items-end">
                <div class="col-md-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-2">
                    <label for="txtPrecioMin" class="form-label">Precio Mín</label>
                    <asp:TextBox ID="txtPrecioMin" runat="server" CssClass="form-control" TextMode="Number" />
                </div>
                <div class="col-md-2">
                    <label for="txtPrecioMax" class="form-label">Precio Máx</label>
                    <asp:TextBox ID="txtPrecioMax" runat="server" CssClass="form-control" TextMode="Number" />
                </div>
                <div class="col-md-2">
                    <label for="ddlMarca" class="form-label">Marca</label>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-2">
                    <label for="ddlCategoria" class="form-label">Categoría</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-1 text-end">
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="btn btn-primary mt-1" OnClick="btnFiltrar_Click" />
                </div>
            </div>
        </asp:Panel>

        <% if (rptItemCarrito.DataSource == null)
            { %>
        <div class="alert alert-info text-center" role="alert">
            Tu carrito está vacío.
        </div>
        <% }
        else
        { %>

        <div class="row">
            <asp:Repeater ID="rptItemCarrito" runat="server">
                <ItemTemplate>
                    <div class="card card-with-hover mb-3 shadow-sm">
                        <div class="card-body d-flex align-items-center justify-content-between gap-3">

                            <div style="width: 100px;">
                                <img src='/Upload/Products/<%# Eval("Producto.Imagenes[0].ImagenUrl") %>'
                                    class="img-fluid rounded" style="object-fit: cover; height: 80px; width: 100%;">
                            </div>

                            <div class="flex-grow-1">
                                <h6 class="mb-1"><%# Eval("Producto.Nombre") %></h6>
                            </div>

                            <div class="d-flex align-items-center gap-2">
                                <asp:Button Text="−" CssClass="btn btn-sm btn-outline-secondary" runat="server"
                                    OnClick="btnRestarCantidad_Click" CommandArgument='<%# Eval("Producto.ID") %>' />
                                <span class="px-2 fw-bold"><%# Eval("Cantidad") %></span>
                                <asp:Button Text="+" CssClass="btn btn-sm btn-outline-secondary" runat="server"
                                    OnClick="btnSumarCantidad_Click" CommandArgument='<%# Eval("Producto.ID") %>' />
                            </div>

                            <div class="text-end" style="width: 120px;">
                                <span class="fw-semibold text-success"><%# Eval("PrecioTotal", "{0:C}") %></span>
                            </div>

                            <div class="text-end">
                                <asp:Button Text="Eliminar" CssClass="btn btn-sm btn-outline-danger" runat="server"
                                    OnClick="btnEliminarItem_Click" CommandArgument='<%# Eval("Producto.ID") %>' />
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="text-end mt-3">
                <h5>Total del Carrito: <span class="text-success fw-bold">$<%= carrito.Total().ToString("N2") %></span></h5>
            </div>
        </div>

        <div class="d-flex justify-content-between mt-4">
            <asp:Button ID="Button1" runat="server" Text="Finalizar Compra"
                CssClass="btn btn-success px-4" OnClick="btnFinalizarCompra_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Vaciar Carrito"
                CssClass="btn btn-outline-danger px-4" OnClick="btnEliminar_Click" />
        </div>

        <% } %>
    </div>
</asp:Content>
