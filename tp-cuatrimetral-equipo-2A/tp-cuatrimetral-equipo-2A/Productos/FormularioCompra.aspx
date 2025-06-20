<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioCompra.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.FormularioCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Confirmacion de Compra</h2>

        <asp:Panel ID="pnlResumen" runat="server" Visible="true">
            <div class="card p-4">
                <h4>Resumen del Pedido</h4>

                <asp:Repeater ID="rptResumenCompra" runat="server">
                    <ItemTemplate>
                        <div class="d-flex justify-content-between mb-2 border-bottom pb-1">
                            <span><%# Eval("Producto.Nombre") %></span>
                            <span>Cantidad: <%# Eval("Cantidad") %></span>
                            <span>Precio Unitario: <%# Eval("Producto.Precio","{0:C}") %></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="d-flex justify-content-between mt-3">
                    <strong>Total: <asp:label runat="server" Text="0" ID="lblPrecioTotal"/></strong>
                </div>

                <asp:Button ID="btnConfirmarCompra" runat="server" CssClass="btn btn-success mt-2" Text="Confirmar y Pagar"
                    OnClick="btnConfirmarCompra_Click" />
                <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-outline-danger mt-2" Text="Cancelar"
                    OnClick="btnVolver_Click" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlConfirmado" runat="server" Visible="false">
            <div class="alert alert-success text-center">
                <h4>¡Gracias por tu compra!</h4>
                <p>Tu pedido fue procesado con éxito.</p>
                <asp:Button ID="Button1" runat="server" 
                    CssClass="btn  btn-success mt-2" 
                    Text="Volver al inicio"
                    OnClick="btnVolver_Click" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
