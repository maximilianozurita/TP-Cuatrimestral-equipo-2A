<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container my-5">
        <h2 class="text-center mb-4">Carrito de Compras</h2>

        

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
                                    class="img-fluid rounded" style="object-fit: contain; height: 80px; width: 100px;">
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

    <asp:ScriptManager ID="ScriptToast" runat="server" />
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
        <div id="toastLogin" class="toast align-items-center text-bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    Inicie sesión o regístrese para realizar la compra.
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function showToastLogin() {
            var toastElement = document.getElementById('toastLogin');
            var bsToast = new bootstrap.Toast(toastElement);
            bsToast.show();
        }
    </script>
</asp:Content>
