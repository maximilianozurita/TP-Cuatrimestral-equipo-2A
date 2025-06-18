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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminVenta))
                {
                    return;
                }
                CargarVentas();
            }
        }

        private void CargarVentas(DateTime? fechaDesde = null, DateTime? fechaHasta = null, string email = "")
        {
            List<Venta> ventas = ventaNeg.Listar();

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