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
            Usuario usuario = (Usuario)Session["Usuario"];
            if (!IsPostBack)
            {
                
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
                
            }
            
            

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
            Usuario usuario = (Usuario)Session["Usuario"];
            if (usuario == null)
            {
                string script = "showToastLogin()";
                ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "toastLoginCart",
                    script,
                    true
                );
                ActualizarVista();
                return;
            }
            Session.Add("Carrito", carrito);
            Response.Redirect("./FormularioCompra.aspx", false);
        }

    }
}