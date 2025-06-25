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
                CargarEstadosEnvio();
                CargarCompras();
            }
        }
        private void CargarEstadosEnvio()
        {
            EnvioNegocio envioNeg = new EnvioNegocio();
            var estados = envioNeg.ListarEstadoEnvios();
            ddlEstadoEnvio.DataSource = estados;
            ddlEstadoEnvio.DataTextField = "Descripcion";
            ddlEstadoEnvio.DataValueField = "ID";
            ddlEstadoEnvio.DataBind();
            ddlEstadoEnvio.Items.Insert(0, new ListItem("Todos", "0"));
        }
        private void CargarCompras()
        {
            VentaNegocio ventaNeg = new VentaNegocio();
            var usuario = (Usuario)Session["usuario"];
            List<Venta> compras = ventaNeg.ListarComprasPorUsuario(usuario.ID);

            if (DateTime.TryParse(txtFechaDesde.Text, out DateTime desde))
                compras = compras.Where(c => c.FechaVenta >= desde).ToList();

            if (DateTime.TryParse(txtFechaHasta.Text, out DateTime hasta))
                compras = compras.Where(c => c.FechaVenta <= hasta).ToList();

            int estadoSeleccionado = int.Parse(ddlEstadoEnvio.SelectedValue);
            if (estadoSeleccionado != 0)
                compras = compras.Where(c => c.Envio?.EstadoEnvio?.ID == estadoSeleccionado).ToList();

            if (compras != null && compras.Count > 0)
            {
                rptCompras.DataSource = compras;
                rptCompras.DataBind();
                pnlSinCompras.Visible = false;
            }
            else
            {
                rptCompras.DataSource = null;
                rptCompras.DataBind();
                pnlSinCompras.Visible = true;
            }
        }
        public string GetStepCss(int step, object estadoObj)
        {
            if (estadoObj == null)
            {
                return "step";
            }

            int estado = Convert.ToInt32(estadoObj);

            if (estado == 4)
            {
                return "step step-cancelled";
            }

            if (estado >= step)
            {
                return "step step-completed";
            }

            return "step";
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            CargarCompras();
        }
    }
}