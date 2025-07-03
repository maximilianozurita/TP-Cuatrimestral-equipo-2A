using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp_cuatrimetral_equipo_2A.Productos;

namespace tp_cuatrimetral_equipo_2A.Mercadopago
{
    public partial class Pendiente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //poner venta como pendiente o no hacer nada creo
            }

        }
    }
}