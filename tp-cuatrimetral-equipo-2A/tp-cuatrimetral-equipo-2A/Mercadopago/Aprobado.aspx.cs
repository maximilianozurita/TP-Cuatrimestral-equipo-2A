using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebPages;
using tp_cuatrimetral_equipo_2A.Productos;

namespace tp_cuatrimetral_equipo_2A.Mercadopago
{
    public partial class Aprobado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                string MercadoReferencia = Request.QueryString["external_reference"];
                if (MercadoReferencia.IsEmpty())
                {
                    return;
                }
                int idVenta = int.Parse(MercadoReferencia);
                VentaNegocio ventaNegocio = new VentaNegocio();
                ventaNegocio.CambiarEstadoVenta(idVenta, 1); // 1 es el estado de aprobado

                Usuario usuario = (Usuario)Session["Usuario"];
                dominio.Carrito carrito = (dominio.Carrito)Session["Carrito"];
                if (carrito is null) return;
                if (usuario != null || carrito.Items.Count == 0)
                {
                    carrito.MarcarTodoEliminado();
                    CarritoNegocio carritoNegocio = new CarritoNegocio();
                    carritoNegocio.GuardarCarritoEnBd(carrito);
                }
                carrito = new dominio.Carrito();
                Session.Add("Carrito", carrito);
            }


        }
    }
}