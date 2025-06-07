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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductoNegocio prodNegocio = new ProductoNegocio();
                rptArticulos.DataSource = prodNegocio.Listar();
                rptArticulos.DataBind();
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

            if (Session["carrito"] == null)
            {
                Session.Add("carrito", new Carrito());
            }

            dominio.Carrito carrito = Session["carrito"] as dominio.Carrito;
            List<Producto> listaArticulos = rptArticulos.DataSource as List<Producto>;
            //carrito.Productos.Add(listaArticulos.Find(p => p.ID == id));


        }

        protected void comprarClick(object sender, EventArgs e)
        {
            Response.Redirect("FormularioCompra.aspx", false);
        }
    }
}