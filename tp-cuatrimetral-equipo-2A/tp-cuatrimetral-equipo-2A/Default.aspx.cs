using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A
{
    public partial class Default : System.Web.UI.Page
    {
        private ProductoNegocio productoNeg = new ProductoNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDestacados();
            }
        }

        private void CargarDestacados()
        {
            bool filtrarDestacado = true;
            List<Producto> productos = productoNeg.Listar(filtrarDestacado);
            rptDestacados.DataSource = productos;
            rptDestacados.DataBind();

            rptCarousel.DataSource = productos.Take(3).ToList();
            rptCarousel.DataBind();
        }
        public string ObtenerPrecioConDescuento(object precioObj, object descuentoObj)
        {
            decimal precio = Convert.ToDecimal(precioObj);
            int descuento = Convert.ToInt32(descuentoObj);

            if (descuento > 0)
            {
                decimal precioFinal = precio * (1 - descuento / 100m);
                return $"<span class='text-muted text-decoration-line-through'>${precio:N2}</span> " +
                       $"<span class='text-danger fw-bold'>${precioFinal:N2}</span> " +
                       $"<span class='text-success'>({descuento}% off)</span>";
            }
            else
            {
                return $"<span class='text-dark fw-bold'>${precio:N2}</span>";
            }
        }
    }
}