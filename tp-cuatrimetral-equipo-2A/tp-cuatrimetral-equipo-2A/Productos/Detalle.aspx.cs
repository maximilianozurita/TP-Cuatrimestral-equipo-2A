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
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void button_aceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("list.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }
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
    }
}