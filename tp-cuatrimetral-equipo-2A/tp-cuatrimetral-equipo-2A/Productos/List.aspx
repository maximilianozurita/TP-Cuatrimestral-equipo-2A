<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="card mb-4 p-3 shadow-sm">
        <div class="row g-3 align-items-end">
            <div class="col-md-3">
                <label for="txtNombre" class="form-label">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Buscar por nombre" />
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
            <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-primary" Text="Filtrar" OnClick="btnFiltrar_Click" />
        </div>
    </div>

    <div class="container mt-5">
        <h2 class="text-center mb-4">Lista de articulos</h2>
        <div class="row justify-content-center">
            <asp:Repeater ID="rptProductos" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4 d-flex">
                        <div class="card text-center w-100">
                            <a href='/Productos/Detalle.aspx?id=<%#Eval("ID") %>'>
                                <img src='/Upload/Products/<%#Eval("Imagenes[0].ImagenUrl") %>' class="card-img-top">
                            </a>
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text"><%#Eval("Descripcion") %></p>
                                <h6 class="card-text"><%# Eval("PrecioConDescuento", "{0:C}") %></h6>
                                <asp:Button class="btn btn-primary mt-4" runat="server"
                                    Text="Agregar al Carrito"
                                    CommandArgument='<%#Eval("ID") %>'
                                    OnClick="carritoClick" 
                                    AutoPostBack="false"/>
                                <asp:Button class="btn btn-primary mt-4" runat="server"
                                    Text="Comprar"
                                    OnClick="comprarClick"
                                    CommandArgument='<%#Eval("ID") %>'
                                    AutoPostBack="false"/>
                                <div class="box-discount">
                                    <div class="discount-content">
                                        %<%#Eval("Descuento") %> OFF
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
