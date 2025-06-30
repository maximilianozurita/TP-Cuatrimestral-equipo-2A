<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-sm">
        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
                <asp:Repeater ID="rptCarousel" runat="server">
                    <ItemTemplate>
                        <div class='carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>'>
                            <img src='/Upload/Products/<%# Eval("Imagenes[0].ImagenUrl") %>' class="d-block w-100" alt="Producto" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="container mt-5">
            <h2>Ofertas destacadas</h2>
            <div class="row">
                <asp:Repeater ID="rptDestacados" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 mb-4 d-flex align-items-stretch">
                            <a href="/Productos/Detalle.aspx?id=<%# Eval("ID") %>" class="card card-with-hover text-decoration-none text-reset w-100">
                                <img src='/Upload/Products/<%# Eval("Imagenes[0].ImagenUrl") %>' class="card-img-top" alt="Producto" />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                </div>
                                <div class="card-footer text-center">
                                    <%# ObtenerPrecioConDescuento(Eval("Precio"), Eval("Descuento")) %>
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
