<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Usuarios.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center mt-5">
      <div class="w-100" style="max-width: 400px;">

            <!-- Email -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                <label for="txtEmail">Email (obligatorio)</label>
            </div>

            <!-- Password -->
            <div class="form-floating mb-3" runat="server" id="divPassword" visible="false">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                <label for="txtPassword">Password (obligatorio)</label>
            </div>
            <!-- Confirmar Password (solo registro) -->
            <div class="form-floating mb-3" runat="server" id="divConfirmarPassword" visible="false">
                <asp:TextBox ID="txtConfirmarPassword" runat="server" CssClass="form-control" placeholder="Confirmar Password" TextMode="Password"></asp:TextBox>
                <label for="txtConfirmarPassword">Confirmar Password</label>
            </div>

            <!-- Nombre (opcional) -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                <label for="txtNombre">Nombre (opcional)</label>
            </div>

            <!-- Apellido (opcional) -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido"></asp:TextBox>
                <label for="txtApellido">Apellido (opcional)</label>
            </div>

            <!-- Teléfono (opcional) -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Teléfono"></asp:TextBox>
                <label for="txtTelefono">Teléfono (opcional)</label>
            </div>

            <!-- Dirección (opcional) -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Dirección"></asp:TextBox>
                <label for="txtDireccion">Dirección (opcional)</label>
            </div>

            <!-- Mensaje de error -->
            <div class="mb-3">
                <asp:Label ID="lblMensajeError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
            </div>

            <!-- Botón de Guardar -->
            <div class="d-grid mt-4">
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" Text="Guardar Usuario" OnClick="btnGuardar_Click" />
            </div>

      </div>
    </div>
</asp:Content>


