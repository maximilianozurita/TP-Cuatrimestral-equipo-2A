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
    public partial class List : System.Web.UI.Page
    {
        public dominio.Carrito carrito = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductoNegocio prodNegocio = new ProductoNegocio();
                rptProductos.DataSource = prodNegocio.Listar();
                rptProductos.DataBind();
                carrito = (dominio.Carrito)Session["Carrito"];
                if (carrito is null)
                {
                    carrito = new dominio.Carrito();
                    Session.Add("Carrito", carrito);
                }
            }
        }

        protected string GetPrimeraImagen(object imagenesObj)
        {
            List<Imagen> lista = imagenesObj as List<Imagen>;
            if (lista != null && lista.Count > 0)
                return lista[0].ImagenUrl;
            return "https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg";
        }

        protected void carritoClick(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            ProductoNegocio productoNegocio = new ProductoNegocio();
            Producto producto = productoNegocio.ProductoPorId(id);

            try
            {
                carrito = (dominio.Carrito)Session["Carrito"];
                carrito.AgregarProducto(producto,1);
                Usuario usuarioId = (Usuario)Session["Usuario"];
                if (usuarioId != null )
                {
                    carrito.UsuarioID = usuarioId.ID;
                    CarritoNegocio carritoNegocio = new CarritoNegocio();
                    carritoNegocio.GuardarCarritoEnBd(carrito);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("../Error.aspx", false);
            }
        }
        protected void comprarClick(object sender, EventArgs e)
        {
            Response.Redirect("FormularioCompra.aspx", false);
        }

    }
}