<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mt-5">
    <div class="row card-detalle">

      <div class="col-md-6 card-detalle-img">
        <div id="carouselproducto" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
              <% bool isFirstImage = true;
                  foreach (dominio.Imagen imagen in producto.Imagen) {
                      string clase = isFirstImage ? "carousel-item active" : "carousel-item";
                      %>
                    <div class="<%= clase %>">
                      <img src="<%= imagen.ImagenUrl %>" class="d-block w-100 img-class">
                    </div>
                <%
                    isFirstImage = false; 
                } 
                %>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselproducto" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselproducto" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
          </button>
        </div>
      </div>

      <div class="col-md-6">
        <h2><%= producto.Nombre %></h2>
        <p><strong>Marca:</strong><%= producto.Marca.Nombre %></p>
        <p><strong>Categoría:</strong> <%= producto.Categoria.Nombre %></p>
        <p><strong>Descripción:</strong></p>
        <p>
          <%= producto.Descripcion %>
        </p>
          <div>
            <asp:Button ID="button_agregar" CssClass="btn btn-primary" runat="server" Text="Agregar al Carrito" OnClick="button_agregar_click"/>
            <asp:Button ID="button_aceptar" CssClass="btn btn-primary" runat="server" Text="Comprar" OnClick="button_aceptar_Click" />
            <a href="\Productos\List.aspx" class="btn btn-secondary">Atras</a>
          </div>
      </div>
    </div>
  </div>
</asp:Content>

