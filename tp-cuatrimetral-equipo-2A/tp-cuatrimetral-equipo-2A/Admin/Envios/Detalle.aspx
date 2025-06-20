<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Envios.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2>Detalle del Envío</h2>
        <hr />
        <asp:Panel ID="pnlCambiarEstado" runat="server" CssClass="mt-4">
            <h5>Estado: </h5>
            <div class="mb-3">
                <asp:DropDownList ID="ddlEstados" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <asp:Button ID="btnCambiarEstado" runat="server" CssClass="btn btn-primary" Text="Guardar Estado" OnClick="btnCambiarEstado_Click" />
            <asp:Label ID="lblCambioEstado" runat="server" CssClass="text-success ms-3" Visible="false" />
        </asp:Panel>
        <div class="mb-3">
            <strong>Dirección de envío:</strong> <asp:Label ID="lblDireccion" runat="server" />
        </div>
        <div class="mb-3">
            <strong>Fecha de venta:</strong> <asp:Label ID="lblFecha" runat="server" />
        </div>
        <div class="mb-3">
            <strong>Cliente:</strong> <asp:Label ID="lblCliente" runat="server" />
        </div>
        <div class="mb-3">
            <strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" />
        </div>

        <h4 class="mt-4">Productos</h4>
        <asp:Repeater ID="rptProductos" runat="server">
            <HeaderTemplate>
                <ul class="list-group mb-4">
            </HeaderTemplate>
            <ItemTemplate>
                <li class="list-group-item">
                    <%# Eval("Producto.Nombre") %> - Cantidad: <%# Eval("Cantidad") %> - Precio: $<%# Eval("PrecioUnitario") %>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>

        <a href="/Admin/Ventas/List.aspx" class="btn btn-outline-secondary">Volver</a>
    </div>
</asp:Content>
