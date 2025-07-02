<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Rechazado.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Mercadopago.Rechazado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow border-0 text-center">
                    <div class="card-body py-5">
                        <i class="bi bi-x-circle-fill text-danger" style="font-size: 4rem;"></i>
                        <h2 class="card-title mt-3 mb-2">Pago rechazado</h2>
                        <p class="card-text fs-5 text-muted">No se pudo procesar tu pago. Verificá los datos o intentá con otro medio.</p>
                        <a href="/Productos/Carrito.aspx" class="btn btn-danger mt-4 me-2">
                            <i class="bi bi-arrow-left-circle me-1"></i> Volver al carrito
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

