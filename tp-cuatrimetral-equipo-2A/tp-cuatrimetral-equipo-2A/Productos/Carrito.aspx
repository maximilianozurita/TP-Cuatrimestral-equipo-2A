<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex flex-column align-items-center mt-4">
      <!-- Título -->
      <div class="d-flex justify-content-center mb-3">
        <h2 class="p-2">Carrito de Compras</h2>
      </div>
      <!-- Lista de productos -->
      <div>
        <!-- Tarjetas -->
        <div class="card mb-3" style="max-width: 800px;">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="https://hiraoka.com.pe/media/mageplaza/blog/post/p/s/ps5-slim-caracteristicas-precio-fecha_de_lanzamiento.jpg" class="card-img-top">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <a href="#" class="text-primary">ProductoA</a>
                <p class="card-text">DescripcionA</p>
                <p class="card-text">Precio: $45654</p>
              </div>
            </div>
          </div>
        </div>
        <div class="card mb-3" style="max-width: 800px;">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="https://hiraoka.com.pe/media/mageplaza/blog/post/p/s/ps5-slim-caracteristicas-precio-fecha_de_lanzamiento.jpg" class="card-img-top">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <a href="#" class="text-primary">ProductoA</a>
                <p class="card-text">DescripcionA</p>
                <p class="card-text">Precio: $45654</p>
              </div>
            </div>
          </div>
        </div>
        <div class="card mb-3" style="max-width: 800px;">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="https://hiraoka.com.pe/media/mageplaza/blog/post/p/s/ps5-slim-caracteristicas-precio-fecha_de_lanzamiento.jpg" class="card-img-top">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <a href="#" class="text-primary">ProductoA</a>
                <p class="card-text">DescripcionA</p>
                <p class="card-text">Precio: $45654</p>
              </div>
            </div>
          </div>
        </div>
        <div class="card mb-3" style="max-width: 800px;">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="https://hiraoka.com.pe/media/mageplaza/blog/post/p/s/ps5-slim-caracteristicas-precio-fecha_de_lanzamiento.jpg" class="card-img-top">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <a href="#" class="text-primary">ProductoA</a>
                <p class="card-text">DescripcionA</p>
                <p class="card-text">Precio: $45654</p>
              </div>
            </div>
          </div>
        </div>

      </div>

      <!-- Botones -->
      <div class="w-100 d-flex justify-content-between align-items-center mt-4 px-4">
        <a href="/Datos Personales.aspx" type="button" class="btn btn-outline-primary">Iniciar Compra</a>
        <asp:Button Text="Eliminar del carrito" CssClass="btn btn-primary me-md-2" ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" />
      </div>
    </div>
</asp:Content>
