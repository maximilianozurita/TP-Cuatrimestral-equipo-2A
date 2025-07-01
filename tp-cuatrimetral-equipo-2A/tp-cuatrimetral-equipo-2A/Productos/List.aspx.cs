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
    public partial class List : System.Web.UI.Page
    {
        public dominio.Carrito carrito = null;
        private ProductoNegocio productoNegocio = new ProductoNegocio();
        private CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        private MarcaNegocio marcaNegocio = new MarcaNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarFiltros();
                FiltrarProductos();
            }
        }

        private void CargarFiltros()
        {
            ddlCategoria.DataSource = categoriaNegocio.Listar();
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();
            ddlCategoria.Items.Insert(0, new ListItem("Todas", "0"));

            ddlMarca.DataSource = marcaNegocio.Listar();
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
            ddlMarca.Items.Insert(0, new ListItem("Todas", "0"));

            ddlOrden.DataSource = new List<string> { "Precio ASC", "Precio DESC", "Oferta" };
            ddlOrden.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            FiltrarProductos();
        }

        private void FiltrarProductos()
        {
            string nombre = txtNombre.Text.Trim().ToLower();
            int idCategoria = int.Parse(ddlCategoria.SelectedValue);
            int idMarca = int.Parse(ddlMarca.SelectedValue);
            string orden = ddlOrden.SelectedValue;

            List<Producto> productos = productoNegocio.Listar();

            if (!string.IsNullOrEmpty(nombre))
                productos = productos.Where(p => p.Nombre.ToLower().Contains(nombre)).ToList();

            if (idCategoria != 0)
                productos = productos.Where(p => p.Categoria != null && p.Categoria.Id == idCategoria).ToList();

            if (idMarca != 0)
                productos = productos.Where(p => p.Marca != null && p.Marca.Id == idMarca).ToList();

            switch (orden)
            {
                case "Precio ASC":
                    productos = productos.OrderBy(p => p.PrecioConDescuento).ToList();
                    break;
                case "Precio DESC":
                    productos = productos.OrderByDescending(p => p.PrecioConDescuento).ToList();
                    break;
                case "Oferta":
                    productos = productos.OrderByDescending(p => p.Descuento).ToList();
                    break;
            }

            rptProductos.DataSource = productos;
            rptProductos.DataBind();

            carrito = (dominio.Carrito)Session["Carrito"];
            if (carrito is null)
            {
                carrito = new dominio.Carrito();
                Session.Add("Carrito", carrito);
            }
        }

        protected string GetPrimeraImagen(object imagenesObj)
        {
            List<Imagen> lista = imagenesObj as List<Imagen>;
            if (lista != null && lista.Count > 0)
                return lista[0].ImagenUrl;
            return "../ImagenDefault.jpg";
        }

        protected void carritoClick(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            Producto producto = productoNegocio.ProductoPorId(id);

            try
            {
                carrito = (dominio.Carrito)Session["Carrito"];
                carrito.AgregarProducto(producto, 1);
                Usuario usuarioId = (Usuario)Session["Usuario"];
                if (usuarioId != null)
                {
                    carrito.UsuarioID = usuarioId.ID;
                    CarritoNegocio carritoNegocio = new CarritoNegocio();
                    carritoNegocio.GuardarCarritoEnBd(carrito);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("../Error.aspx", false);
            }
        }

        protected void comprarClick(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["Usuario"];
            if(usuario == null)
            {
                Response.Redirect("../Usuarios/Login.aspx", false);
                return;
            }
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            Producto producto = productoNegocio.ProductoPorId(id);
            carrito = new dominio.Carrito();
            carrito.AgregarProducto(producto, 1);
            carrito.CompraUnitaria = true;
            Session.Add("Carrito", carrito);
            Response.Redirect("./FormularioCompra.aspx", false);
        }
    }
}