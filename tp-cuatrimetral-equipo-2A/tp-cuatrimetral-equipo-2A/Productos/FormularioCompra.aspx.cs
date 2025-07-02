using dominio;
using MercadoPago.Client.Payment;
using MercadoPago.Client.Preference;
using MercadoPago.Config;
using MercadoPago.Resource.Payment;
using MercadoPago.Resource.Preference;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
                        lblPrecioTotal.Text = carrito.SumaTotal.ToString("C2");
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
            if (RadioButtonMercadopago.Checked)
            {

                MercadoPagoConfig.AccessToken = PagoNegocio.ObtenerPagos().Token;
                var lista = new List<PreferenceItemRequest>();
                carrito = (dominio.Carrito)Session["Carrito"];
                carrito.Items.ForEach(item =>
                {
                    lista.Add(new PreferenceItemRequest
                    {
                        Title = item.Producto.Nombre,
                        Quantity = item.Cantidad,
                        CurrencyId = "ARS",
                        UnitPrice = (Decimal)item.Producto.PrecioConDescuento
                    });
                });
                Venta venta = new Venta
                {
                    SumaTotal = carrito.SumaTotal,
                    FechaVenta = DateTime.Now,
                    Usuario = (Usuario)Session["Usuario"],
                    VentaProducto = carrito.Items.Select(item => new VentaProducto
                    {
                        Producto = item.Producto,
                        Cantidad = item.Cantidad,
                        PrecioUnitario = (decimal)item.Producto.PrecioConDescuento
                    }).ToList()
                };
                VentaNegocio ventaNegocio = new VentaNegocio();
                int idVenta = ventaNegocio.CrearVenta(venta);

                var request = new PreferenceRequest
                {
                    Items = lista,
                    BackUrls = new PreferenceBackUrlsRequest
                    {
                        Success = "https://localhost:44324/Mercadopago/Aprobado.aspx",
                        Failure = "https://localhost:44324/Mercadopago/Rechazado.aspx",
                        Pending = "https://localhost:44324/Mercadopago/Pendiente.aspx"
                    },
                    AutoReturn = "approved",
                    ExternalReference = idVenta.ToString()

                };

                var client = new PreferenceClient();
                Preference preference = client.CreateAsync(request).Result;
                Response.Redirect($"{preference.InitPoint}");
            }
            else
            {
                Usuario usuario = Session["Usuario"] as Usuario;
                EmailService emailService = new EmailService();
                string CBU =  PagoNegocio.ObtenerPagos().CBU;
                string Alias = PagoNegocio.ObtenerPagos().Alias;
                string mensaje = $"<h1>Gracias por su compra!</h1><p>El total de su compra es: {carrito.SumaTotal.ToString("C2")}</p>";
                mensaje += "<p>Detalles de la compra:</p><ul>";
                foreach (var item in carrito.Items)
                {
                    mensaje += $"<li>{item.Producto.Nombre} - Cantidad: {item.Cantidad} - Precio Unitario: {item.Producto.PrecioConDescuento.ToString("C2")}</li>";
                }
                mensaje += "</ul>";
                mensaje += "<p>A continuacion le detallamos los datos de transferencia </p>";
                mensaje += "<p>CBU:"+ CBU + "</p>";
                mensaje += "<p>Alias: "+ Alias + "</p>";
                mensaje += $"<p>Monto: {carrito.SumaTotal.ToString("C2")}</p>";
                emailService.SetMail(usuario.Email, "Confirmación de compra", mensaje);
                emailService.SendMail();
                Response.Redirect("../Mercadopago/Pendiente.aspx");
            }


        }
        public void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default.aspx");
        }

    }
}