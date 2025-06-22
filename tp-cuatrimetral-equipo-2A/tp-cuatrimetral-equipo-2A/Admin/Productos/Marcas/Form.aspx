<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Productos.Marcas.Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">
                    <asp:Label ID="lblTitulo" runat="server" Text="Nueva Marca" />
                </h5>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre de la Marca</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false" />
                </div>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                <a href="List.aspx" class="btn btn-secondary ms-2">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
