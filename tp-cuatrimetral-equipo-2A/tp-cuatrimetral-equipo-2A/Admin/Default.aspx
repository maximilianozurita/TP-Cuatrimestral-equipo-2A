<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container mt-5">
        <h2 class="text-center mb-4">Panel de Administración</h2>
        <div class="row justify-content-center g-4">

            <% if (Session["usuario"] != null) { %>
                <% if (((dominio.Usuario)Session["usuario"]).AdminProductos()) { %>
                <!-- Productos -->
                <div class="col-md-4">
                    <div class="card card-with-hover text-center shadow">
                        <div class="card-body">
                            <h5 class="card-title">Productos</h5>
                            <p class="card-text">Gestionar productos del sistema</p>
                            <a href="/Admin/Productos/List.aspx" class="btn btn-primary">Ir a Productos</a>
                        </div>
                    </div>
                </div>
                <!-- Marcas -->
                <div class="col-md-4">
                    <div class="card card-with-hover text-center shadow">
                        <div class="card-body">
                            <h5 class="card-title">Marcas</h5>
                            <p class="card-text">Gestionar marcas</p>
                            <a href="/Admin/Productos/Marcas/List.aspx" class="btn btn-primary">Ir a Marcas</a>
                        </div>
                    </div>
                </div>

                <!-- Categorías -->
                <div class="col-md-4">
                    <div class="card card-with-hover text-center shadow">
                        <div class="card-body">
                            <h5 class="card-title">Categorías</h5>
                            <p class="card-text">Gestionar categorías</p>
                            <a href="/Admin/Productos/Categorias/List.aspx" class="btn btn-primary">Ir a Categorías</a>
                        </div>
                    </div>
                </div>
                <% } %>
                <!-- Usuarios -->
                <% if (((dominio.Usuario)Session["usuario"]).AdminUsuarios()) { %>
                <div class="col-md-4">
                    <div class="card card-with-hover text-center shadow">
                        <div class="card-body">
                            <h5 class="card-title">Usuarios</h5>
                            <p class="card-text">Administrar usuarios registrados</p>
                            <a href="/Admin/Usuarios/List.aspx" class="btn btn-primary">Ir a Usuarios</a>
                        </div>
                    </div>
                </div>
                <% } %>
                <!-- Ventas -->
                <% if (((dominio.Usuario)Session["usuario"]).AdminVentas()) { %>
                <div class="col-md-4">
                    <div class="card card-with-hover text-center shadow">
                        <div class="card-body">
                            <h5 class="card-title">Ventas</h5>
                            <p class="card-text">Ver y controlar ventas</p>
                            <a href="/Admin/Ventas/List.aspx" class="btn btn-primary">Ir a Ventas</a>
                        </div>
                    </div>
                </div>
                <% } %>
            <% } %>
        </div>
    </div>
</asp:Content>
