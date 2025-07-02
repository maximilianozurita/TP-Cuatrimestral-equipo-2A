using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp_cuatrimetral_equipo_2A.Productos;

namespace tp_cuatrimetral_equipo_2A.Mercadopago
{
    public partial class Pendiente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                dominio.Carrito carrito = (dominio.Carrito)Session["Carrito"];
                Usuario usuario = (Usuario)Session["Usuario"];
                if(carrito == null || carrito.Items.Count == 0 || usuario == null)
                {
                    Response.Redirect("../Default.aspx");
                    return;
                }
                VentaNegocio ventaNegocio = new VentaNegocio();
                Venta venta = new Venta
                {
                    SumaTotal = carrito.SumaTotal,
                    FechaVenta = DateTime.Now,
                    Usuario = usuario,
                    VentaProducto = carrito.Items.Select(item => new VentaProducto
                    {
                        Producto = item.Producto,
                        Cantidad = item.Cantidad,
                        PrecioUnitario = (decimal)item.Producto.PrecioConDescuento
                    }).ToList()
                };
                ventaNegocio.CrearVenta(venta);
            }

        }
    }
}