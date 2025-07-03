using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimetral_equipo_2A.Mercadopago
{
    public partial class Rechazado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int idVenta = int.Parse(Request.QueryString["external_reference"]);
                VentaNegocio ventaNegocio = new VentaNegocio();
                ventaNegocio.CambiarEstadoVenta(idVenta, -1); // -1 es el estado de rechazado
            }

        }
    }
}