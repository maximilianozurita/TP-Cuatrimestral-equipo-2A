<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pendiente.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Mercadopago.Pendiente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow border-0 text-center">
                    <div class="card-body py-5">
                        <i class="bi bi-hourglass-split text-warning" style="font-size: 4rem;"></i>
                        <h2 class="card-title mt-3 mb-2">Pago pendiente</h2>
                        <p class="card-text fs-5 text-muted">Estamos procesando tu pago. Te notificaremos por email cuando se confirme.</p>
                        <a href="/Productos/MisCompras.aspx" class="btn btn-warning mt-4">
                            <i class="bi bi-clock-history me-1"></i> Ver estado de la Compra
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

