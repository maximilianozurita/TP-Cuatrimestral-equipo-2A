<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-sm">
        <div class=" row mx-4 mt-3">
            <div id="carouselExample" class="carousel slide">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="https://electroluxar.vtexassets.com/arquivos/ids/162316/STK12-1.png?v=637963421546730000" class="d-block w-100">
                </div>
                <div class="carousel-item">
                  <img src="https://atma.com.ar/media/catalog/product/cache/c8f6a96bef9e9f64cd4973587df2520f/c/e/ceat5403gp_iadbsm0000.jpg" class="d-block w-100">
                </div>
                <div class="carousel-item">
                  <img src="https://hiraoka.com.pe/media/mageplaza/blog/post/p/s/ps5-slim-caracteristicas-precio-fecha_de_lanzamiento.jpg" class="d-block w-100">
                </div>
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
        </div>
        <div class="row mx-4 mt-5">
            <h2>Ofertas</h2>
            <div class="card-group">
                <div class="col-lg-4">
                    <a href="#" class="card mx-2 text-decoration-none text-reset">
                        <img src="https://hiraoka.com.pe/media/mageplaza/blog/post/p/s/ps5-slim-caracteristicas-precio-fecha_de_lanzamiento.jpg" class="card-img-top" alt="..">
                        <div class="card-body">
                            <h5 class="card-title">nombreA</h5>
                            <p class="card-text">DescripcionA</p>
                        </div>
                        <div class="card-footer text-lg-center">
                            <small class="text-muted m-1">$5546</small>
                            <small class="text-muted m-1">Descuento: 5%</small>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4">
                    <a href="#" class="card mx-2 text-decoration-none text-reset">
                        <img src="https://hiraoka.com.pe/media/mageplaza/blog/post/p/s/ps5-slim-caracteristicas-precio-fecha_de_lanzamiento.jpg" class="card-img-top" alt="..">
                        <div class="card-body">
                            <h5 class="card-title">nombreA</h5>
                            <p class="card-text">DescripcionA</p>
                        </div>
                        <div class="card-footer text-lg-center">
                            <small class="text-muted m-1">$5546</small>
                            <small class="text-muted m-1">Descuento: 5%</small>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4">
                    <a href="#" class="card mx-2 text-decoration-none text-reset">
                        <img src="https://hiraoka.com.pe/media/mageplaza/blog/post/p/s/ps5-slim-caracteristicas-precio-fecha_de_lanzamiento.jpg" class="card-img-top" alt="..">
                        <div class="card-body">
                            <h5 class="card-title">nombreA</h5>
                            <p class="card-text">DescripcionA</p>
                        </div>
                        <div class="card-footer text-lg-center">
                            <small class="text-muted m-1">$5546</small>
                            <small class="text-muted m-1">Descuento: 5%</small>
                        </div>
                    </a>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
