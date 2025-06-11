<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Usuarios.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<body>
        <div class="container mt-5">
            <h2>Usuarios</h2>
            <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="gvUsuarios_RowCommand" DataKeyNames="ID">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                    <asp:BoundField DataField="Direccion" HeaderText="Direccion" />
                    <asp:BoundField DataField="FechaAlta" HeaderText="FechaAlta" />
                    <asp:ButtonField Text="Modificar" CommandName="Modificar" ButtonType="Button" />
                    <asp:ButtonField Text="Dar de baja" CommandName="Baja" ButtonType="Button" />
                </Columns>
            </asp:GridView>
        </div>
</body>
</asp:Content>
