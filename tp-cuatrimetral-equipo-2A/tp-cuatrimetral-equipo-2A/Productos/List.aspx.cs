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
                List<Producto> ListaProducto = new List<Producto>();
                ListaProducto = prodNegocio.Listar();
                System.Diagnostics.Debug.WriteLine("Cantidad de imágenes: " + ListaProducto.Count);
                rptArticulos.DataSource = ListaProducto;
                rptArticulos.DataBind();
            }
        }

        protected string GetPrimeraImagen(object o)
        {
            return "";
        }
    }
}