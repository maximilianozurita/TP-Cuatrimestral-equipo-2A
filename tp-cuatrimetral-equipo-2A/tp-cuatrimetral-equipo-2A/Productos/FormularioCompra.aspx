<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioCompra.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.FormularioCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Confirmacion de Compra</h2>

        <asp:Panel ID="pnlResumen" runat="server" Visible="true">
            <div class="card p-4">

                <h4>Resumen del Pedido</h4>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio Unitario</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptResumenCompra" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Producto.Nombre") %></td>
                                    <td><%# Eval("Cantidad") %></td>
                                    <td><%# Eval("Producto.PrecioConDescuento", "{0:C}") %></td>
                                    <td><%# (Convert.ToDecimal(Eval("Cantidad")) * 
                                                Convert.ToDecimal(Eval("Producto.PrecioConDescuento"))).ToString("C") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" class="text-end"><strong>Total:</strong></td>
                            <td>
                                <strong>
                                    <asp:Label runat="server" Text="0" ID="lblPrecioTotal" /></strong>
                            </td>
                        </tr>
                    </tfoot>
                </table>

                <asp:Panel ID="pnlFormaPago" runat="server" Visible="true">
                    <div class="form-check mt-4 mb-2">
                        <asp:RadioButton ID="RadioButtonTransferencia" runat="server" GroupName="FormaPago"
                            CssClass="form-check-input"
                            Checked="true" />
                        <asp:Label runat="server" CssClass="form-check-label"
                            for="RadioButton1">Transferencia Bancaria</asp:Label>
                    </div>
                    <div class="form-check mb-4">
                        <asp:RadioButton ID="RadioButtonMercadopago" runat="server" GroupName="FormaPago"
                            CssClass="form-check-input" />
                        <asp:Label runat="server"
                            CssClass="form-check-label" for="RadioButton2">Mercadopago</asp:Label>
                    </div>
                </asp:Panel>

                <asp:Button ID="btnConfirmarCompra" runat="server" CssClass="btn btn-success mt-2" Text="Confirmar y Pagar"
                    OnClick="btnConfirmarCompra_Click" />

                <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-outline-danger mt-2" Text="Cancelar"
                    OnClick="btnVolver_Click" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
