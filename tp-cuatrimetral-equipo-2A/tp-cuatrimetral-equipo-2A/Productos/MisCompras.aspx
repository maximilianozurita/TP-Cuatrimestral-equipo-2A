<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.MisCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Panel ID="pnlFiltros" runat="server" CssClass="container my-4">
    <div class="card shadow-sm border-0">
        <div class="card-body">
            <h5 class="card-title mb-4"><i class="bi bi-funnel-fill me-2"></i>Filtrar Compras</h5>
            <div class="row g-3">
                <div class="col-md-4">
                    <label for="txtFechaDesde" class="form-label">Fecha desde:</label>
                    <asp:TextBox ID="txtFechaDesde" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="col-md-4">
                    <label for="txtFechaHasta" class="form-label">Fecha hasta:</label>
                    <asp:TextBox ID="txtFechaHasta" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="col-md-4">
                    <label for="ddlEstadoEnvio" class="form-label">Estado de envío:</label>
                    <asp:DropDownList ID="ddlEstadoEnvio" runat="server" CssClass="form-select" />
                </div>
            </div>
            <div class="mt-4 text-end">
                <asp:Button ID="btnFiltrar" runat="server" CssClass="btn btn-primary px-4" Text="Aplicar filtros" OnClick="btnFiltrar_Click" />
            </div>
        </div>
    </div>
</asp:Panel>


<div class="container my-5">
    <h2 class="mb-4 text-center">Mis Compras</h2>

    <asp:Repeater ID="rptCompras" runat="server">
        <ItemTemplate>
            <div class="card shadow-sm mb-4 border-0">
                <div class="card-header bg-gradient bg-primary text-white d-flex justify-content-between">
                    <div>
                        <strong>Fecha:</strong> <%# Eval("FechaVenta", "{0:dd/MM/yyyy}") %>
                    </div>
                    <div>
                        <span class="badge bg-light text-dark fw-semibold px-3 py-2">
                            Total: $<%# Eval("SumaTotal") %>
                        </span>
                    </div>
                </div>

                <div class="card-body">

                    <div class="mb-3">
                        <%# Eval("Envio.EstadoEnvio.Descripcion") != null 
                            ? $"<span class='badge bg-info text-dark'><i class=\"bi bi-truck me-1\"></i>Estado: {Eval("Envio.EstadoEnvio.Descripcion")}</span>" 
                            : "<span class='badge bg-secondary'>Sin estado</span>" %>
                    </div>

                    <asp:Repeater ID="rptProductos" runat="server" DataSource='<%# Eval("VentaProducto") %>'>
                        <ItemTemplate>
                            <div class="d-flex justify-content-between border-bottom py-2">
                                <div>
                                    <strong><%# Eval("Producto.Nombre") %></strong><br />
                                    <small class="text-muted"><%# Eval("Producto.Descripcion") %></small>
                                </div>
                                <div class="text-end">
                                    <span class="text-muted small">x<%# Eval("Cantidad") %></span><br />
                                    <strong>$<%# Eval("PrecioUnitario", "{0:N2}") %></strong>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Panel ID="pnlEstadoEnvio" runat="server" CssClass="mt-4">
                        <div class="d-flex justify-content-between text-center stepper">
                            <div class='<%# GetStepCss(1, Eval("Envio.EstadoEnvio.ID")) %>'>
                                <div class="circle">1</div>
                                <div class="label">Pendiente</div>
                            </div>
                            <div class="line"></div>
                            <div class='<%# GetStepCss(2, Eval("Envio.EstadoEnvio.ID")) %>'>
                                <div class="circle">2</div>
                                <div class="label">En camino</div>
                            </div>
                            <div class="line"></div>
                            <div class='<%# GetStepCss(3, Eval("Envio.EstadoEnvio.ID")) %>'>
                                <div class="circle">3</div>
                                <div class="label">Entregado</div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:Panel ID="pnlSinCompras" runat="server" Visible="false">
        <div class="alert alert-info text-center">
            Aún no realizaste ninguna compra.
        </div>
    </asp:Panel>
</div>
</asp:Content>
