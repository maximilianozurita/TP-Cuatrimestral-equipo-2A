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
    public partial class Carrito : System.Web.UI.Page
    {
        public dominio.Carrito carrito = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            carrito = (dominio.Carrito)Session["Carrito"];
            if (!IsPostBack)
            {
                Usuario usuario = (Usuario)Session["Usuario"];
                if (carrito is null && usuario is null)
                {
                    carrito = new dominio.Carrito();
                    Session.Add("Carrito", carrito);
                }
                else if (usuario != null)
                {
                    CarritoNegocio carritoNegocio = new CarritoNegocio();
                    carrito = carritoNegocio.CarritoPorUsuarioID(usuario.ID);
                    if (carrito != null)
                    {
                        Session.Add("Carrito", carrito);
                        rptItemCarrito.DataSource = carrito.Items;
                        rptItemCarrito.DataBind();
                    }
                    else
                    {
                        carrito = new dominio.Carrito();
                        Session.Add("Carrito", carrito);
                    }
                }
                else if (carrito != null && carrito.Items.Count > 0)
                {
                    rptItemCarrito.DataSource = carrito.Items;
                    rptItemCarrito.DataBind();
                }
                CargarFiltros();
            }

        }
        protected void CargarFiltros()
        {
            MarcaNegocio marcaNeg = new MarcaNegocio();
            ddlMarca.DataSource = marcaNeg.Listar();
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "ID";
            ddlMarca.DataBind();
            ddlMarca.Items.Insert(0, new ListItem("Todas", ""));

            CategoriaNegocio catNeg = new CategoriaNegocio();
            ddlCategoria.DataSource = catNeg.Listar();
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "ID";
            ddlCategoria.DataBind();
            ddlCategoria.Items.Insert(0, new ListItem("Todas", ""));
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {

            Usuario usuario = (Usuario)Session["Usuario"];
            if (carrito is null) return;
            if (usuario != null)
            {
                carrito.MarcarTodoEliminado();
                CarritoNegocio carritoNegocio = new CarritoNegocio();
                carritoNegocio.GuardarCarritoEnBd(carrito);
            }
            carrito = new dominio.Carrito();
            Session.Add("Carrito", carrito);
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            if (carrito == null) return;

            string nombre = txtNombre.Text.ToLower();
            float precioMin = 0;
            float precioMax = 0;
            int marcaId = 0;
            int categoriaId = 0;

            if (!string.IsNullOrWhiteSpace(txtPrecioMin.Text))
            {
                precioMin = float.Parse(txtPrecioMin.Text);
            }

            if (!string.IsNullOrWhiteSpace(txtPrecioMax.Text))
            {
                precioMax = float.Parse(txtPrecioMax.Text);
            }

            if (!string.IsNullOrWhiteSpace(ddlMarca.SelectedValue))
            {
                marcaId = int.Parse(ddlMarca.SelectedValue);
            }

            if (!string.IsNullOrWhiteSpace(ddlCategoria.SelectedValue))
            {
                categoriaId = int.Parse(ddlCategoria.SelectedValue);
            }

            var filtrados = carrito.Items.Where(item =>
                (string.IsNullOrEmpty(nombre) || item.Producto.Nombre.ToLower().Contains(nombre)) &&
                (precioMin == 0 || item.Producto.PrecioConDescuento >= precioMin) &&
                (precioMax == 0 || item.Producto.PrecioConDescuento <= precioMax) &&
                (marcaId == 0 || item.Producto.Marca.Id == marcaId) &&
                (categoriaId == 0 || item.Producto.Categoria.Id == categoriaId)
            ).ToList();

            rptItemCarrito.DataSource = filtrados;
            rptItemCarrito.DataBind();
        }
        protected void btnEliminarItem_Click(object sender, EventArgs e)
        {
            if (carrito == null) return;
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            Usuario usuario = (Usuario)Session["Usuario"];
            carrito.EliminarProducto(id);
            if (usuario != null)
            {
                CarritoNegocio carritoNegocio = new CarritoNegocio();
                carritoNegocio.GuardarCarritoEnBd(carrito);
            }
            carrito.Items = carrito.Items.FindAll(item => item.flag_Eliminado == false);
            Session.Add("Carrito", carrito);
            ActualizarVista();

        }

        protected void btnRestarCantidad_Click(object sender, EventArgs e)
        {
            if (carrito == null) return;
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            Usuario usuario = (Usuario)Session["Usuario"];
            carrito.QuitarUnidad(id);
            if (usuario != null)
            {
                CarritoNegocio carritoNegocio = new CarritoNegocio();
                carritoNegocio.GuardarCarritoEnBd(carrito);
            }
            carrito.Items = carrito.Items.FindAll(item => item.flag_Eliminado == false);
            Session.Add("Carrito", carrito);
            ActualizarVista();
        }

        protected void btnSumarCantidad_Click(object sender, EventArgs e)
        {
            if (carrito == null) return;
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            Usuario usuario = (Usuario)Session["Usuario"];
            carrito.AgregarUnidad(id);
            if (usuario != null)
            {
                CarritoNegocio carritoNegocio = new CarritoNegocio();
                carritoNegocio.GuardarCarritoEnBd(carrito);
            }
            Session.Add("Carrito", carrito);
            ActualizarVista();

        }

        private void ActualizarVista()
        {
            if (carrito.Items.Count > 0)
            {
                rptItemCarrito.DataSource = carrito.Items;
                rptItemCarrito.DataBind();
            }
        }

        public void btnFinalizarCompra_Click(object sender, EventArgs e)
        {
            Session.Add("Carrito", carrito);
            Response.Redirect("./FormularioCompra.aspx", false);
        }

    }
}