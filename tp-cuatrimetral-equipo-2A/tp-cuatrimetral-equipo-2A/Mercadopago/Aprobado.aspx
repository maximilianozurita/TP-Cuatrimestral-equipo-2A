<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Aprobado.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Mercadopago.Aprobado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow border-0 text-center">
                    <div class="card-body py-5">
                        <i class="bi bi-check-circle-fill text-success" style="font-size: 4rem;"></i>
                        <h2 class="card-title mt-3 mb-2">¡Pago aprobado!</h2>
                        <p class="card-text fs-5 text-muted">Gracias por tu compra. El pago se procesó correctamente.</p>
                        
                        <a href="/Productos/List.aspx" class="btn btn-outline-primary mt-4 me-2">
                            <i class="bi bi-shop me-1"></i> Seguir comprando
                        </a>

                        <a href="/Pedidos/MisPedidos.aspx" class="btn btn-success mt-4">
                            <i class="bi bi-receipt me-1"></i> Ver mis pedidos
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

