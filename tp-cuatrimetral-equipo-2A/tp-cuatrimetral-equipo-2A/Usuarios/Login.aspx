<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Usuarios.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center mt-5">
        <div class="w-100" style="max-width: 400px;">
          <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email</label>
            <asp:TextBox runat="server" type="email" CssClass="form-control" ID="txtEmail" placeholder="Email" />
          </div>
          <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <asp:TextBox runat="server" type="password" CssClass="form-control" ID="txtContraseña" placeholder="Password" />
          </div>
            <div class="mb-3">
                <asp:Label ID="lblMensajeError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
            </div>
            <div class="mb-3">
                <span><a href="./RecuperarContrasena.aspx">Recuperar contraseña</a></span>
            </div>
            <asp:Button Text="Iniciar sesión" CssClass="btn btn-primary" ID="ButtonAceptar" OnClick="ButtonAceptar_Click" runat="server" />
            <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="btnCancelar" OnClick="btnCancelar_Click" runat="server" />
        </div>
    </div>
</asp:Content>
