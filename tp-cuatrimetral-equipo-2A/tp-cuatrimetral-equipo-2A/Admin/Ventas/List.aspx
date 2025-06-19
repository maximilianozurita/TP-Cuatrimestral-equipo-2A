<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Ventas.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container my-4">
    <div class="row gx-3 gy-2 align-items-center">
        <div class="col-md-3">
            <div class="d-flex align-items-center">
                <label for="ddlEstadoEnvio" class="form-label me-2 mb-0" style="min-width: 100px;">Estado envío:</label>
                <asp:DropDownList ID="ddlEstadoEnvio" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Todos" Value="" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="col-md-4">
            <div class="d-flex align-items-center">
                <label for="txtFiltroEmail" class="form-label me-2 mb-0" style="min-width: 100px;">Email:</label>
                <asp:TextBox ID="txtFiltroEmail" runat="server" CssClass="form-control" placeholder="usuario@mail.com" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="d-flex align-items-center">
                <label for="txtFechaDesde" class="form-label me-2 mb-0" style="min-width: 100px;">Desde:</label>
                <asp:TextBox ID="txtFechaDesde" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
        </div>

        <div class="col-md-3">
            <div class="d-flex align-items-center">
                <label for="txtFechaHasta" class="form-label me-2 mb-0" style="min-width: 100px;">Hasta:</label>
                <asp:TextBox ID="txtFechaHasta" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
        </div>

        <div class="col-md-2">
            <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-primary w-100" Text="Filtrar" OnClick="btnFiltrar_Click" />
        </div>

    </div>
</div>

    <asp:Repeater ID="rptVentas" runat="server">
        <ItemTemplate>
            <div class="card mb-3">
                <div class="card-header">
                    Venta ID: <%# Eval("ID") %> - Cliente: <%# Eval("Usuario.Email") %> - Total: $<%# Eval("SumaTotal") %>
                </div>
                <div class="card-body">
                    <strong>Fecha:</strong> <%# Eval("FechaVenta", "{0:dd/MM/yyyy}") %><br />
                    <strong>Estado de Envío:</strong> <%# Eval("Envio.EstadoEnvio.Descripcion") ?? "Sin estado" %><br />
                    <asp:Repeater ID="rptProductos" runat="server" DataSource='<%# Eval("VentaProducto") %>'>
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("Producto.Nombre") %> - Cantidad: <%# Eval("Cantidad") %> - Precio: $<%# Eval("PrecioUnitario") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="mt-3">
        <strong>Total ventas:</strong> $<asp:Label ID="lblTotalVentas" runat="server" Text="0"></asp:Label>
    </div>
    <%--ToDo: Agregar estado de envio, boton para ir a gestionar el envio y verificar evento enter que cierra sesion--%>
</asp:Content>
