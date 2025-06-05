<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RecuperarContrasena.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Usuarios.RecuperarContrasena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center mt-5">
        <div class="w-100" style="max-width: 400px;">
            <h4 class="mb-4 text-center">Recuperar contraseña</h4>

            <div class="mb-3">
                <label for="txtEmailRecuperar" class="form-label">Email</label>
                <asp:TextBox ID="txtEmailRecuperar" runat="server" CssClass="form-control" TextMode="Email" placeholder="name@example.com" />
            </div>

            <div class="d-grid">
                <asp:Button ID="btnRecuperar" runat="server" Text="Enviar mail" CssClass="btn btn-primary" OnClick="btnRecuperar_Click" />
            </div>

        </div>
    </div>
</asp:Content>

