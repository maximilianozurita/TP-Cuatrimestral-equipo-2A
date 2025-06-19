using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A.Admin.Ventas
{
    public partial class List : System.Web.UI.Page
    {
        private VentaNegocio ventaNeg = new VentaNegocio();
        private EnvioNegocio envioNeg = new EnvioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminVenta))
                {
                    return;
                }
                CargarListadoEstadoEnvio();
                CargarVentas();
            }
        }
        private void CargarListadoEstadoEnvio()
        {
            List<EstadoEnvio> estadoEnvio = envioNeg.ListarEstadoEnvios();
            ddlEstadoEnvio.DataSource = estadoEnvio;
            ddlEstadoEnvio.DataTextField = "Descripcion";
            ddlEstadoEnvio.DataValueField = "ID";
            ddlEstadoEnvio.DataBind();
            ddlEstadoEnvio.Items.Insert(0, new ListItem("Todos", ""));
        }
        private void CargarVentas(DateTime? fechaDesde = null, DateTime? fechaHasta = null, string email = "")
        {
            int? estadoSeleccionado = string.IsNullOrEmpty(ddlEstadoEnvio.SelectedValue) ? null : (int?)int.Parse(ddlEstadoEnvio.SelectedValue);

            List<Venta> ventas = ventaNeg.Listar(estadoSeleccionado);

            if (fechaDesde.HasValue)
            {
                ventas = ventas.Where(v => v.FechaVenta >= fechaDesde.Value).ToList();
            }

            if (fechaHasta.HasValue)
            {
                ventas = ventas.Where(v => v.FechaVenta <= fechaHasta.Value).ToList();
            }

            if (!string.IsNullOrEmpty(email))
            {
                ventas = ventas.Where(v => v.Usuario.Email.IndexOf(email, StringComparison.OrdinalIgnoreCase) >= 0).ToList();
            }

            rptVentas.DataSource = ventas;
            rptVentas.DataBind();

            float totalVentas = ventas.Sum(v => v.SumaTotal);
            lblTotalVentas.Text = totalVentas.ToString("N2");
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            DateTime? fechaDesde = null;
            DateTime? fechaHasta = null;
            string email = txtFiltroEmail.Text.Trim();
            if (!string.IsNullOrEmpty(txtFechaDesde.Text))
            {
                fechaDesde = DateTime.Parse(txtFechaDesde.Text);
            }
            if (!string.IsNullOrEmpty(txtFechaHasta.Text))
            {
                fechaHasta = DateTime.Parse(txtFechaHasta.Text);
            }
            CargarVentas(fechaDesde, fechaHasta, email);
        }
    }
}