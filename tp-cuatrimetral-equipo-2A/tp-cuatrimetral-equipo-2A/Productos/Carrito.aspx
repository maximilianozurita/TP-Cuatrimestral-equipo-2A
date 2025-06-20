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
        <div class="container">

            <asp:Repeater ID="rptItemCarrito" runat="server">
                <ItemTemplate>
                    <div class="card mb-2" style="height: 10rem;">
                        <div class="card-body d-flex gap-3">

                            <div style="width: 8rem;">
                                <img src='<%# GetPrimeraImagen(Eval("Producto.Imagenes")) %>'
                                    class="rounded img-fluid"
                                    style="height: 8rem; width: 8rem; object-fit: cover;">
                            </div>

                            <div class="d-flex align-items-center " style="width: 20rem;">
                                <span><%# Eval("Producto.Nombre") %></span>
                            </div>
                            <div class="d-flex align-items-center justify-content-center" style="width: 5rem;">
                                <asp:Button Text="-"
                                    CssClass="btn btn-sm btn-primary"
                                    runat="server"
                                    OnClick="btnRestarCantidad_Click"
                                    CommandArgument='<%#Eval("Producto.ID") %>' />
                                <span class="ml-3 mr-3"><%# Eval("Cantidad") %></span>
                                <asp:Button Text="+"
                                    CssClass="btn btn-sm btn-primary me-2"
                                    runat="server"
                                    OnClick="btnSumarCantidad_Click"
                                    CommandArgument='<%#Eval("Producto.ID") %>' />
                            </div>
                            <div class="d-flex align-items-center justify-content-center" style="width: 10rem;">
                                <span class="ml-3 mr-3">$<%# Eval("PrecioTotal") %></span>
                            </div>
                            <div class="d-flex align-items-center justify-content-end" style="width: 10rem;">
                                <asp:Button Text="Eliminar"
                                    CssClass="btn btn-sm btn-danger"
                                    runat="server"
                                    OnClick="btnEliminarItem_Click"
                                    CommandArgument='<%#Eval("Producto.ID") %>' />
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <div class="w-100 d-flex justify-content-between align-items-center mt-4 px-4 mt-4">
            <a href="/Datos Personales.aspx" type="button" class="btn btn-outline-primary">Finalizar compra Compra</a>
            <asp:Button Text="Vaciar Carrito" CssClass="btn btn-primary me-md-2" ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" AutoPostBack="false" />
        </div>
        <% } %>
    </div>
</asp:Content>
