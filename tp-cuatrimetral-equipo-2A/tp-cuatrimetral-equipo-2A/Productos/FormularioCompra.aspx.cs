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
    public partial class FormularioCompra : System.Web.UI.Page
    {
        public dominio.Carrito carrito = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            carrito = (dominio.Carrito)Session["Carrito"];
            if (carrito == null || carrito.Items.Count == 0) Response.Redirect("../Default.aspx");
            if (!IsPostBack)
            {
                Usuario usuario = (Usuario)Session["Usuario"];
                if (usuario != null && !carrito.CompraUnitaria)
                {
                    CarritoNegocio carritoNegocio = new CarritoNegocio();
                    carrito = carritoNegocio.CarritoPorUsuarioID(usuario.ID);
                    if (carrito != null)
                    {
                        Session.Add("Carrito", carrito);
                        rptResumenCompra.DataSource = carrito.Items;
                        rptResumenCompra.DataBind();
                    }
                    else
                    {
                        carrito = new dominio.Carrito();
                        Session.Add("Carrito", carrito);
                    }
                }
                else
                {
                    lblPrecioTotal.Text = carrito.SumaTotal.ToString("C2");
                    rptResumenCompra.DataSource = carrito.Items;
                    rptResumenCompra.DataBind();
                }
            }
        }

        public void btnConfirmarCompra_Click(object sender, EventArgs e)
        {

        }
        public void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default.aspx");
        }
    }
}