using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimetral_equipo_2A.Admin.Cobros
{
    public partial class Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Pago pago = PagoNegocio.ObtenerPagos();
                txtAlias.Text = pago.Alias;
                txtCBU.Text = pago.CBU;
                txtToken.Text = pago.Token;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //faltan un par de validaciones
            Pago pago = new Pago();
            pago.Alias = txtAlias.Text;
            pago.Token = txtToken.Text;
            pago.CBU = txtCBU.Text;
            PagoNegocio.SetearPago(pago);
            lblMensaje.Visible = true;
            lblMensaje.Text = "Guardado con exito";
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../Admin/Default.aspx", false);
        }
    }
}