using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A.Productos
{
    public partial class MisCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Helper.VerificarUsuario(Session, Response, Permisos.Cliente))
                {
                    return;
                }
                CargarCompras();
            }
        }
        private void CargarCompras()
        {
            VentaNegocio ventaNeg = new VentaNegocio();
            var usuario = (Usuario)Session["usuario"];
            List<Venta> compras = ventaNeg.ListarComprasPorUsuario(usuario.ID);
            if (compras != null && compras.Count > 0)
            {
                rptCompras.DataSource = compras;
                rptCompras.DataBind();
                pnlSinCompras.Visible = false;
            }
            else
            {
                pnlSinCompras.Visible = true;
            }

        }
        public string GetStepCss(int step, object estadoObj)
        {
            if (estadoObj == null)
                return "step";

            int estado = Convert.ToInt32(estadoObj);

            if (estado == 4) // Suponiendo que 4 es "Cancelado"
                return "step step-cancelled";

            if (estado >= step)
                return "step step-completed";

            return "step";
        }
    }
}