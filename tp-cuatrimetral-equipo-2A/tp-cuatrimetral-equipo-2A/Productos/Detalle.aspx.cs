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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.producto = Session["productoDetalle"] as Producto;
                Session.Remove("productoDetalle");
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
    }
}