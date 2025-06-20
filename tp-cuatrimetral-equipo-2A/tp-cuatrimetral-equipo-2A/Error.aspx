<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="error-page-container text-center">
        <h2>¡Ups! Ocurrió un error</h2>
        <p>Algo salió mal mientras procesábamos tu solicitud.</p>
        <hr />
        <p>
            <strong>Detalle técnico:</strong><br />
            <asp:Label ID="lblMensaje" runat="server" Text="Error desconocido"></asp:Label>
        </p>
        <a href="/Default.aspx" class="btn btn-outline-dark mt-3">Volver al inicio</a>
    </div>
</asp:Content>
