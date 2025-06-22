<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.MisCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="mb-4 text-center">Mis Compras</h2>

        <asp:Repeater ID="rptCompras" runat="server">
            <ItemTemplate>
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <div>
                            <small class="text-white-50">Fecha: <%# Eval("FechaVenta", "{0:dd/MM/yyyy}") %></small>
                        </div>
                        <div>
                            <span class="badge rounded-pill bg-light text-dark px-3 py-2">
                                Total: $<%# Eval("SumaTotal") %>
                            </span>
                        </div>
                    </div>

                    <div class="card-body">
                        <!-- Estado de envío -->
                        <div class="mb-3">
                            <%# Eval("Envio.EstadoEnvio.Descripcion") != null 
                                ? $"<span class='badge bg-info text-dark'>Estado: {Eval("Envio.EstadoEnvio.Descripcion")}</span>" 
                                : "<span class='badge bg-secondary'>Sin estado</span>" %>
                        </div>

                        <!-- Lista de productos -->
                        <asp:Repeater ID="rptProductos" runat="server" DataSource='<%# Eval("VentaProducto") %>'>
                            <ItemTemplate>
                                <div class="d-flex justify-content-between border-bottom py-2">
                                    <div>
                                        <strong><%# Eval("Producto.Nombre") %></strong><br />
                                        <%# Eval("Producto.Descripcion") %>
                                    </div>
                                    <div class="text-end">
                                        <span class="text-muted">x<%# Eval("Cantidad") %></span><br />
                                        $<%# Eval("PrecioUnitario", "{0:N2}") %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Panel ID="pnlEstadoEnvio" runat="server" CssClass="mt-3">
                            <div class="d-flex justify-content-between align-items-center text-center stepper">
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
