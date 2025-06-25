<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.Favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="mb-4 text-center">Mis Productos Favoritos</h2>


        <asp:Panel ID="pnlFiltros" runat="server" CssClass="mb-4">
            <div class="row g-3 align-items-end">
                <div class="col-md-3">
                    <label for="txtNombre" class="form-label">Buscar por nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <label for="ddlMarca" class="form-label">Marca</label>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-3">
                    <label for="ddlCategoria" class="form-label">Categoría</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-3">
                    <label for="ddlOrden" class="form-label">Ordenar por</label>
                    <asp:DropDownList ID="ddlOrden" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Precio ascendente" Value="PrecioAsc" />
                        <asp:ListItem Text="Precio descendente" Value="PrecioDesc" />
                        <asp:ListItem Text="Descuento" Value="Descuento" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="mt-3 text-end">
                <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-primary" Text="Aplicar filtros" OnClick="btnFiltrar_Click" />
            </div>
        </asp:Panel>


        <asp:Repeater ID="rptFavoritos" runat="server">
            <ItemTemplate>
                <div class="card card-with-hover mb-4 shadow-sm">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="/Upload/Products/<%# Eval("Imagenes[0].ImagenUrl") %>" class="img-fluid rounded-start" alt="<%# Eval("Nombre") %>" />
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                <p class="card-text"><%# Eval("Descripcion") %></p>
                                <p class="card-text">
                                    <span class="badge bg-secondary me-2"><%# Eval("Marca.Nombre") %></span>
                                    <span class="badge bg-info text-dark"><%# Eval("Categoria.Nombre") %></span>
                                </p>
                                <p class="card-text fw-bold mb-2">
                                    <%# Eval("Descuento") != null && (float)Eval("Descuento") > 0 
                                        ? $"<span class='text-muted text-decoration-line-through me-2'>${Eval("Precio", "{0:N2}")}</span><span class='text-success'>${Eval("PrecioConDescuento", "{0:N2}")}</span>"
                                        : $"<span>${Eval("Precio", "{0:N2}")}</span>" %>
                                </p>
                                <a href='/Productos/Detalle.aspx?id=<%# Eval("ID") %>' class="btn btn-primary me-2">Ver Detalle</a>
                                <asp:Button ID="btnEliminar" runat="server" Text="Quitar de Favoritos" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-outline-danger" OnClick="btnEliminar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Panel ID="pnlSinFavoritos" runat="server" Visible="false">
            <div class="alert alert-info text-center">
                Aún no agregaste productos a favoritos.
            </div>
        </asp:Panel>
    </div>
</asp:Content>
