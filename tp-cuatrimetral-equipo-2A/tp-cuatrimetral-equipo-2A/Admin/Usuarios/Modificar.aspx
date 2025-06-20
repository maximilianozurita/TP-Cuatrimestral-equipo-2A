<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Modificar.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Usuarios.Modificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5" style="max-width: 500px;">
        <h2>Modificar Usuario</h2>

        <!-- Email -->
        <div class="form-floating mb-3">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
            <label for="txtEmail">Email</label>
        </div>

        <!-- Nombre -->
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
            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Telefono"></asp:TextBox>
            <label for="txtTelefono">Teléfono</label>
        </div>

        <!-- Dirección -->
        <div class="form-floating mb-3">
            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Direccion"></asp:TextBox>
            <label for="txtDireccion">Dirección</label>
        </div>

        <!-- Permisos -->
        <asp:CheckBoxList ID="cblPermisos" runat="server"></asp:CheckBoxList>

        <!-- Error -->
        <asp:Label ID="lblMensajeError" runat="server" CssClass="text-danger" Visible="false" />

        <!-- Botón -->
        <div class="d-grid mt-4">
            <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" Text="Guardar cambios" OnClick="btnGuardar_Click" />
        </div>
    </div>
</asp:Content>
