<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container mt-4">
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <h5 class="card-title mb-3"><i class="bi bi-funnel-fill me-2"></i>Filtrar productos</h5>
            <div class="row g-3 align-items-end">
                <div class="col-md-3">
                    <label for="txtNombre" class="form-label">Nombre:</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Buscar por nombre..." />
                </div>
                <div class="col-md-3">
                    <label for="ddlMarca" class="form-label">Marca:</label>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-3">
                    <label for="ddlCategoria" class="form-label">Categoría:</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-3">
                    <label for="ddlOrden" class="form-label">Ordenar por:</label>
                    <asp:DropDownList ID="ddlOrden" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Precio (menor a mayor)" Value="precio_asc" />
                        <asp:ListItem Text="Precio (mayor a menor)" Value="precio_desc" />
                        <asp:ListItem Text="Descuento (mayor primero)" Value="descuento_desc" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="mt-3 text-end">
                <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-primary" Text="Aplicar filtros" OnClick="btnFiltrar_Click" />
            </div>
        </div>
    </div>
</div>
<div class="container mt-5">
    <h2 class="text-center mb-4">Lista de artículos</h2>
    <div class="row">
        <asp:Repeater ID="rptProductos" runat="server">
            <ItemTemplate>
                <div class="col-lg-4 col-md-6 mb-4 d-flex align-items-stretch">
                    <div class="card card-with-hover shadow-sm border-0 w-100">
                        <div class="position-relative">
                            <a href='/Productos/Detalle.aspx?id=<%# Eval("ID") %>'>
                                <img src='/Upload/Products/<%# Eval("Imagenes[0].ImagenUrl") %>' class="card-img-top" alt="<%# Eval("Nombre") %>">
                            </a>
                            <%# Eval("Descuento") != null && (float)Eval("Descuento") > 0 ? $"<span class='badge bg-danger position-absolute top-0 end-0 m-2'>%{Eval("Descuento")}</span>" : "" %>
                        </div>
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title mb-1"><%# Eval("Nombre") %></h5>
                            <p class="card-text text-muted small"><%# Eval("Descripcion") %></p>
                            <h6 class="fw-bold mb-3 text-success"><%# Eval("PrecioConDescuento", "{0:C}") %></h6>
                            <div class="mt-auto">
                                <asp:Button runat="server" CssClass="btn btn-outline-primary w-100 mb-2" Text="Agregar al Carrito"
                                    CommandArgument='<%# Eval("ID") %>' OnClick="carritoClick" />
                                <asp:Button runat="server" CssClass="btn btn-success w-100" Text="Comprar ahora"
                                    CommandArgument='<%# Eval("ID") %>' OnClick="comprarClick" />
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
</asp:Content>
