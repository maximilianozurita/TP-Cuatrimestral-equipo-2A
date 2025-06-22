using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A.Admin.Envios
{
    public partial class Detalle : System.Web.UI.Page
    {
        private VentaNegocio ventaNeg = new VentaNegocio();
        private EnvioNegocio envioNeg = new EnvioNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int ventaId;
                if (Request.QueryString["ventaId"] != null && int.TryParse(Request.QueryString["ventaId"], out ventaId))
                {
                    CargarEstados();
                    CargarDatos(ventaId);
                }
                else
                {
                    Response.Redirect("/Error.aspx");
                }
            }
        }
        private void CargarEstados()
        {
            var estados = envioNeg.ListarEstadoEnvios();
            ddlEstados.DataSource = estados;
            ddlEstados.DataTextField = "Descripcion";
            ddlEstados.DataValueField = "Id";
            ddlEstados.DataBind();
        }
        private void CargarDatos(int ventaId)
        {
            Venta venta = ventaNeg.FindByVentaId(ventaId);
            if (venta == null)
            {
                Response.Redirect("/Error.aspx");
                return;
            }

            lblDireccion.Text = venta.Usuario.Direccion;
            lblFecha.Text = venta.FechaVenta.ToString("dd/MM/yyyy");
            lblCliente.Text = venta.Usuario.Nombre + " "+ venta.Usuario.Apellido;
            lblEmail.Text = venta.Usuario.Email;

            rptProductos.DataSource = venta.VentaProducto;
            rptProductos.DataBind();

            ddlEstados.SelectedValue = venta.Envio.EstadoEnvio.ID.ToString();
        }

        protected void btnCambiarEstado_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["ventaId"] == null || !int.TryParse(Request.QueryString["ventaId"], out int ventaId))
                {
                    lblCambioEstado.Text = "Error al identificar la venta.";
                    lblCambioEstado.CssClass = "text-danger";
                    lblCambioEstado.Visible = true;
                    return;
                }

                int nuevoEstadoId = int.Parse(ddlEstados.SelectedValue);
                envioNeg.ActualizarEstadoEnvio(ventaId, nuevoEstadoId);

                lblCambioEstado.Text = "Estado actualizado correctamente.";
                lblCambioEstado.CssClass = "text-success";
                lblCambioEstado.Visible = true;

                CargarDatos(ventaId);
            }
            catch (Exception ex)
            {
                Session["error"] = ex.ToString();
                Response.Redirect("/Error.aspx");
            }
        }
    }
}