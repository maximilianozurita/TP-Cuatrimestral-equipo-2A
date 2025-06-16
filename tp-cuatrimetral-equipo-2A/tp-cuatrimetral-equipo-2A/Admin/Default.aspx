<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Ver si agregar gestion de permisos, categorias y marcas--%>
        <div class="container mt-5">
        <h2 class="text-center mb-4">Panel de Administración</h2>
        <div class="row justify-content-center g-4">

            <!-- Productos -->
            <div class="col-md-4">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <h5 class="card-title">Productos</h5>
                        <p class="card-text">Gestionar productos del sistema</p>
                        <a href="/Admin/Productos/List.aspx" class="btn btn-primary">Ir a Productos</a>
                    </div>
                </div>
            </div>

            <!-- Usuarios -->
            <div class="col-md-4">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <h5 class="card-title">Usuarios</h5>
                        <p class="card-text">Administrar usuarios registrados</p>
                        <a href="/Admin/Usuarios/List.aspx" class="btn btn-primary">Ir a Usuarios</a>
                    </div>
                </div>
            </div>

            <!-- Ventas -->
            <div class="col-md-4">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <h5 class="card-title">Ventas</h5>
                        <p class="card-text">Ver y controlar ventas</p>
                        <a href="/Admin/Ventas/List.aspx" class="btn btn-primary">Ir a Ventas</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
