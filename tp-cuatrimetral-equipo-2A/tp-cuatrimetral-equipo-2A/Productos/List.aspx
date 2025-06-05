<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
      <h2 class="text-center mb-4">Lista de articulos</h2>
      <div class="row justify-content-center">
            <asp:Repeater ID="rptArticulos" runat="server">
                <ItemTemplate>
                <div class="col-md-4 mb-4 d-flex">
                    <div class="card text-center w-100">
                        <a href='/Detalle.aspx?id=<%#Eval("ID") %>'>
                            <img src='<%# GetPrimeraImagen(Eval("Imagen")) %>' class="card-img-top">
                        </a>
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                            <h6 class="card-text">$ <%#Eval("Precio") %></h6>
                            <asp:Button class="btn btn-primary mt-4" runat="server" 
                                Text="Agregar al Carrito"
                                CommandArgument =<%#Eval("ID") %>
                                onClick="carritoClick" />
                            <asp:Button class="btn btn-primary mt-4" runat="server" 
                                Text="Comprar"
                                onClick="comprarClick"/>
                        </div>
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
      </div>
    </div>
</asp:Content>
