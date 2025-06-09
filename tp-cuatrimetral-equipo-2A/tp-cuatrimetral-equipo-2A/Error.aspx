<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Upss! Hubo un problema</h1>
    <asp:Label Text="Hubo un error" ID="lblMensaje" runat="server" />
    <a href="/Default.aspx" class="btn btn-primary">Volver a home</a>
</asp:Content>
