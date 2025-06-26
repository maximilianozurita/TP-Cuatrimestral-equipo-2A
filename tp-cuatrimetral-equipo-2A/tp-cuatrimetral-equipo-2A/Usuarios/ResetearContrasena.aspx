<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ResetearContrasena.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Usuarios.ResetearContrasena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="card shadow-sm p-4" style="max-width: 400px; width: 100%;">
            <h4 class="mb-4 text-center text-primary">Restablecer Contraseña</h4>

            <div class="mb-3">
                <label for="txtNuevaPass" class="form-label">Nueva Contraseña</label>
                <asp:TextBox ID="txtNuevaPass" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Nueva contraseña" />
            </div>

            <div class="mb-3">
                <label for="TextVerificarPass" class="form-label">Confirmar Contraseña</label>
                <asp:TextBox ID="TextVerificarPass" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Verificar contraseña" />
            </div>

            <asp:Button ID="btnCambiar" runat="server" Text="Cambiar contraseña" OnClick="btnCambiar_Click" CssClass="btn btn-success w-100" />

            <div class="mt-3 text-center">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-success fw-bold" />
                <asp:Label ID="lblMensajeError" runat="server" CssClass="text-danger fw-bold" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
