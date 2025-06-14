<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex flex-column align-items-center mt-4">
        <!-- Título -->
        <div class="d-flex justify-content-center mb-3">
            <h2 class="p-2">Carrito de Compras</h2>
        </div>

        <% if (rptItemCarrito.DataSource == null)
            { %>
        <h5 class="">Carrito vacio</h5>
        <% }
            else
            { %>
        <asp:Repeater ID="rptItemCarrito" runat="server">
            <ItemTemplate>
                <p class="card-text"><%#Eval("Producto.Nombre") %></p>
                <p class="card-text"><%#Eval("Cantidad") %></p>
            </ItemTemplate>
        </asp:Repeater>
        <div class="w-100 d-flex justify-content-between align-items-center mt-4 px-4">
            <a href="/Datos Personales.aspx" type="button" class="btn btn-outline-primary">Finalizar compra Compra</a>
            <asp:Button Text="Eliminar del carrito" CssClass="btn btn-primary me-md-2" ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" AutoPostBack="false" />
        </div>
        <% } %>
    </div>
</asp:Content>
