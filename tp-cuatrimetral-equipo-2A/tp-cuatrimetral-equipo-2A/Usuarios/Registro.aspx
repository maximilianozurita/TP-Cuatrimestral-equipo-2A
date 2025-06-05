<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Usuarios.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center mt-5">
      <div class="w-100" style="max-width: 400px;">
        <!-- Nombre -->
        <div class="form-floating mb-3">
          <input type="text" class="form-control" id="nombre" placeholder="Nombre">
          <label for="nombre">Nombre</label>
        </div>

        <!-- Apellido -->
        <div class="form-floating mb-3">
          <input type="text" class="form-control" id="apellido" placeholder="Apellido">
          <label for="apellido">Apellido</label>
        </div>

        <!-- Email -->
        <div class="form-floating mb-3">
          <input type="email" class="form-control" id="email" placeholder="Email">
          <label for="email">Email</label>
        </div>

        <!-- Password -->
        <div class="form-floating mb-3">
          <input type="password" class="form-control" id="password" placeholder="Password">
          <label for="password">Password</label>
        </div>

        <!-- Teléfono -->
        <div class="form-floating mb-3">
          <input type="tel" class="form-control" id="telefono" placeholder="Teléfono">
          <label for="telefono">Teléfono</label>
        </div>

        <!-- Dirección -->
        <div class="form-floating mb-3">
          <input type="text" class="form-control" id="direccion" placeholder="Dirección">
          <label for="direccion">Dirección</label>
        </div>

        <div class="d-grid mt-4">
          <button type="submit" class="btn btn-primary">Guardar Usuario</button>
        </div>
      </div>
    </div>
</asp:Content>
