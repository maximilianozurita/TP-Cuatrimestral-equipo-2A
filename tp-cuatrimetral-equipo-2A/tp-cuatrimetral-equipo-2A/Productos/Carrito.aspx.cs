using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimetral_equipo_2A.Productos
{
    public partial class Carrito : System.Web.UI.Page
    {
        public dominio.Carrito carrito = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carrito = (dominio.Carrito)Session["Carrito"];
                if (carrito is null)
                {
                    carrito = new dominio.Carrito();
                    Session.Add("Carrito", carrito);
                }
                else 
                {
                    rptItemCarrito.DataSource = carrito.Items;
                    rptItemCarrito.DataBind();
                }
            }
            
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            carrito = (dominio.Carrito)Session["Carrito"];
            if (carrito != null)
            {
                carrito = new dominio.Carrito();
                Session.Add("Carrito", carrito);
            }
        }
    }
}