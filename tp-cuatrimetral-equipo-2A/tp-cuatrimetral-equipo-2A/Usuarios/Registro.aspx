<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Usuarios.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center mt-5">
      <div class="w-100" style="max-width: 400px;">

            <!-- Email -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                <label for="txtEmail">Email</label>
            </div>

            <!-- Password -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                <label for="txtPassword">Password</label>
            </div>

            <%--Inputs opcionales a visualizar al modificar--%>
<%--            <!-- Nombre -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                <label for="txtNombre">Nombre</label>
            </div>

            <!-- Apellido -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido"></asp:TextBox>
                <label for="txtApellido">Apellido</label>
            </div>

            <!-- Teléfono -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Teléfono"></asp:TextBox>
                <label for="txtTelefono">Teléfono</label>
            </div>

            <!-- Dirección -->
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Dirección"></asp:TextBox>
                <label for="txtDireccion">Dirección</label>
            </div>--%>



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


