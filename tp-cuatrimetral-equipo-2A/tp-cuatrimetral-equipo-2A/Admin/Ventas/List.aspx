<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Ventas.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-4">
        <!-- Filtros -->
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <div class="row gx-3 gy-2 align-items-end">

                    <div class="col-md-2">
                        <label for="ddlEstadoEnvio" class="form-label">Estado:</label>
                        <asp:DropDownList ID="ddlEstadoEnvio" runat="server" CssClass="form-select w-100" />
                    </div>

                    <div class="col-md-3">
                        <label for="txtFiltroEmail" class="form-label">Email:</label>
                        <asp:TextBox ID="txtFiltroEmail" runat="server" CssClass="form-control w-100" placeholder="usuario@mail.com" />
                    </div>

                    <div class="col-md-2">
                        <label for="txtFechaDesde" class="form-label">Desde:</label>
                        <asp:TextBox ID="txtFechaDesde" runat="server" CssClass="form-control w-100" TextMode="Date" />
                    </div>

                    <div class="col-md-2">
                        <label for="txtFechaHasta" class="form-label">Hasta:</label>
                        <asp:TextBox ID="txtFechaHasta" runat="server" CssClass="form-control w-100" TextMode="Date" />
                    </div>

                    <div class="col-md-2">
                        <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-primary w-100 mt-4" Text="Filtrar" OnClick="btnFiltrar_Click" />
                    </div>

                </div>
            </div>
        </div>

        <!-- Listado de Ventas -->
        <asp:Repeater ID="rptVentas" runat="server">
            <ItemTemplate>
                <div class="card mb-4 shadow-sm border-start border-4">
                    <div class="card-header bg-light fw-bold">
                        Venta ID: <%# Eval("ID") %> &nbsp;&nbsp;|&nbsp;&nbsp;
                        Cliente: <%# Eval("Usuario.Email") %> &nbsp;&nbsp;|&nbsp;&nbsp;
                        Total: $<%# Eval("SumaTotal") %>
                    </div>

                    <div class="card-body">
                        <div class="mb-2">
                            <strong>Fecha:</strong> <%# Eval("FechaVenta", "{0:dd/MM/yyyy}") %><br />
                            <strong>Estado de Envío:</strong> <%# Eval("Envio.EstadoEnvio.Descripcion") ?? "Sin estado" %>
                        </div>

                        <a href='/Admin/Envios/Detalle.aspx?ventaId=<%# Eval("ID") %>' class="btn btn-outline-secondary btn-sm mb-3">
                            Ver detalle del envío
                        </a>

                        <asp:Repeater ID="rptProductos" runat="server" DataSource='<%# Eval("VentaProducto") %>'>
                            <HeaderTemplate>
                                <ul class="list-group list-group-flush">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span><%# Eval("Producto.Nombre") %> (x<%# Eval("Cantidad") %>)</span>
                                    <span>$<%# Eval("PrecioUnitario") %></span>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <!-- Total Ventas -->
        <div class="text-end mt-3">
            <strong>Total ventas:</strong> $<asp:Label ID="lblTotalVentas" runat="server" CssClass="fw-bold" Text="0"></asp:Label>
        </div>
    </div>
</asp:Content>
