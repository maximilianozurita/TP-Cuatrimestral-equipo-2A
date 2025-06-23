<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Productos.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <!-- Galería de imágenes -->
            <div class="col-md-6">
                <div id="carouselProducto" class="carousel slide shadow-sm" data-bs-ride="carousel">
                    <div class="carousel-inner rounded">
                        <% bool isFirstImage = true;
                            foreach (dominio.Imagen imagen in producto.Imagenes) {
                                string clase = isFirstImage ? "carousel-item active" : "carousel-item";
                        %>
                            <div class="<%= clase %>">
                                <img src="/Upload/Products/<%= imagen.ImagenUrl %>" class="d-block w-100" alt="Imagen del producto">
                            </div>
                        <% isFirstImage = false; } %>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselProducto" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselProducto" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    </button>
                </div>
            </div>

            <!-- Detalles del producto -->
            <div class="col-md-6">
                <h2 class="fw-bold mb-3"><%= producto.Nombre %></h2>

                <p class="mb-1"><strong>Marca:</strong> <%= producto.Marca?.Nombre %></p>
                <p class="mb-3"><strong>Categoría:</strong> <%= producto.Categoria?.Nombre %></p>

                <div class="mb-4">
                    <% if (producto.Descuento > 0) { %>
                        <div>
                            <span class="producto-precio-original me-2">$<%= producto.Precio.ToString("N2") %></span>
                            <span class="producto-precio-descuento">$<%= producto.PrecioConDescuento.ToString("N2") %></span>
                        </div>
                        <span class="badge bg-success mt-1">Descuento <%= producto.Descuento %>%</span>
                    <% } else { %>
                        <div class="producto-precio-descuento">$<%= producto.Precio.ToString("N2") %></div>
                    <% } %>
                </div>

                <p><strong>Descripción:</strong></p>
                <p><%= producto.Descripcion %></p>

                <div class="d-flex flex-wrap gap-2 mt-4">
                    <asp:Button ID="button_agregar" runat="server" Text="Agregar al Carrito" CssClass="btn btn-primary" OnClick="button_agregar_click" />
                    <asp:Button ID="button_aceptar" runat="server" Text="Comprar Ahora" CssClass="btn btn-success" OnClick="button_aceptar_Click" />
                    <asp:Button ID="btnFavorito" runat="server" Text="❤️ Agregar a Favoritos" CssClass="btn btn-outline-danger" OnClick="btnFavorito_Click" />
                    <a href="/Productos/List.aspx" class="btn btn-outline-secondary">← Volver</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

