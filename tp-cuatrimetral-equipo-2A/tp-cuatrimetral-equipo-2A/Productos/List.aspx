<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .box-discount {
            width: 150px;
            height: 150px;
            overflow: hidden;
            position: absolute;
            top: -10px;
            left: -10px;
        }

        .discount-content {
            width: 225px;
            font-size: 1.2rem;
            font-weight: 800;
            text-align: center;
            padding: 8px 0;
            background: #46464a;
            color: #f70b52;
            position: absolute;
            transform: rotate(-45deg);
            padding-left: 5px;
            left: -40%;
            top: 25%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Lista de articulos</h2>
        <div class="row justify-content-center">
            <asp:Repeater ID="rptProductos" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4 d-flex">
                        <div class="card text-center w-100">
                            <a href='/Productos/Detalle.aspx?id=<%#Eval("ID") %>'>
                                <img src='/Upload/Products/<%#Eval("Imagenes[0].ImagenUrl") %>' class="card-img-top">
                            </a>
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text"><%#Eval("Descripcion") %></p>
                                <h6 class="card-text"><%# Eval("PrecioConDescuento", "{0:C}") %></h6>
                                <asp:Button class="btn btn-primary mt-4" runat="server"
                                    Text="Agregar al Carrito"
                                    CommandArgument='<%#Eval("ID") %>'
                                    OnClick="carritoClick" 
                                    AutoPostBack="false"/>
                                <asp:Button class="btn btn-primary mt-4" runat="server"
                                    Text="Comprar"
                                    OnClick="comprarClick" 
                                    AutoPostBack="false"/>
                                <div class="box-discount">
                                    <div class="discount-content">
                                        %<%#Eval("Descuento") %> OFF
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
