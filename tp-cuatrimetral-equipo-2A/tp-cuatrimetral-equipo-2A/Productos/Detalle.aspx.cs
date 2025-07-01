using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimetral_equipo_2A.Productos
{
    public partial class Detalle : System.Web.UI.Page
    {
        public Producto producto = new Producto();
        public dominio.Carrito carrito = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Request.QueryString["id"]);
                ProductoNegocio productoNegocio = new ProductoNegocio();
                List<Producto> productos = productoNegocio.Listar();
                producto = productos.First(producto => producto.ID == id);
                if (!IsPostBack)
                {

                    Usuario user = (Usuario)Session["usuario"];
                    if (user != null)
                    {
                        if (productoNegocio.EsFavorito(user.ID, producto.ID))
                        {
                            btnFavorito.Text = "❤️ En Favoritos";
                            btnFavorito.CssClass = "btn btn-danger";
                        }
                    }

                    carrito = (dominio.Carrito)Session["Carrito"];
                    if (carrito is null)
                    {
                        carrito = new dominio.Carrito();
                        Session.Add("Carrito", carrito);
                    }
                }
                
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("/Error.aspx", false);
            }
        }

        protected void button_aceptar_Click(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["Usuario"];
            if (usuario == null)
            {
                Response.Redirect("../Usuarios/Login.aspx", false);
                return;
            }
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            ProductoNegocio productoNegocio = new ProductoNegocio();
            Producto producto = productoNegocio.ProductoPorId(id);
            carrito = new dominio.Carrito();
            carrito.AgregarProducto(producto, 1);
            carrito.CompraUnitaria = true;
            Session.Add("Carrito", carrito);
            Response.Redirect("./FormularioCompra.aspx", false);
        }

        protected void button_agregar_click(object sender, EventArgs e)
        {
            try
            {
                carrito = (dominio.Carrito)Session["Carrito"];
                carrito.AgregarProducto(producto,1);
                Usuario usuarioId = (Usuario)Session["Usuario"];
                if (usuarioId != null)
                {
                    carrito.UsuarioID = usuarioId.ID;
                    CarritoNegocio carritoNegocio = new CarritoNegocio();
                    carritoNegocio.GuardarCarritoEnBd(carrito);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("/Error.aspx", false);
            }
        }
        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            Usuario user = (Usuario)Session["usuario"];
            if (user != null && producto != null)
            {
                ProductoNegocio productoNegocio = new ProductoNegocio();
                if (!productoNegocio.EsFavorito(user.ID, producto.ID))
                {
                    productoNegocio.AgregarFavorito(user.ID, producto.ID);
                    btnFavorito.Text = "❤️ En Favoritos";
                    btnFavorito.CssClass = "btn btn-danger";
                }
                else
                {
                    productoNegocio.EliminarFavorito(user.ID, producto.ID);
                    btnFavorito.Text = "❤️ Agregar a Favoritos";
                    btnFavorito.CssClass = "btn btn-outline-danger";
                }
            }
            else
            {
                Response.Redirect("/Usuarios/Login.aspx");
            }
        }
    }
}