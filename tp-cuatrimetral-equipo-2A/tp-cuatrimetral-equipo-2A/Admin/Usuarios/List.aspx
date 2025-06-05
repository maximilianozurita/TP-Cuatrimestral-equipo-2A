<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Usuarios.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table">
        <thead class="table table-striped-columns">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Email</th>
                <th scope="col">Celular</th>
                <th scope="col">Fecha de Nacimiento</th>

            </tr>
        </thead>
        <tbody>
<%--            <% foreach (var item in Listausuarios)
                { %>
            <tr>
                <th scope="row"><%=item.ID %></th>
                <td><%=item.Nombre %></td>
                <td><%=item.Apellido %></td>
                <td><%=item.Email %></td>
                <td><%=item.Celular %></td>
                <td><%=item.FechaNacimiento %></td>

            </tr>
            <%} %>--%>
            <tr>
                <th scope="row">12546</th>
                <td>nombreA></td>
                <td>apellidoA</td>
                <td>EmailA</td>
                <td>15654654</td>
                <td>12-12-12</td>
            </tr>
            <tr>
                <th scope="row">12546</th>
                <td>nombreAb</td>
                <td>apellidoA</td>
                <td>EmailA</td>
                <td>1565465465</td>
                <td>12-12-12</td>
            </tr>
            <tr>
                <th scope="row">12546</th>
                <td>nombreb</td>
                <td>apellidoA</td>
                <td>EmailA</td>
                <td>1565465489</td>
                <td>12-12-12</td>
            </tr>
    </table>
</asp:Content>
