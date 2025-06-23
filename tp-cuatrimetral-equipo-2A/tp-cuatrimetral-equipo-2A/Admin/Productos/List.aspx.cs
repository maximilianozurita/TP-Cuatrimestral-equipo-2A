using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A.Admin.Productos
{
    public partial class List : System.Web.UI.Page
    {
        public List<Producto> ListaProductos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminProducto))
            {
                return;
            }
            try
            {
                if (!IsPostBack)
                {
                    CargarListado();
                }
            }
            catch (Exception ex)
            {
                Session["Error"] = ex.Message;
                Response.Redirect("~/Error.aspx", false);
            }
        }
        private void CargarListado()
        {
            ProductoNegocio productoNeg = new ProductoNegocio();
            ListaProductos = productoNeg.Listar();
            gvProductos.DataSource = ListaProductos;
            gvProductos.DataBind();
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Productos/Form.aspx");
        }

        protected void gvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Editar")
            {
                Response.Redirect("/Admin/Productos/Form.aspx?id=" + id);
            }
            else if (e.CommandName == "Eliminar")
            {
                ProductoNegocio productoNeg = new ProductoNegocio();
                productoNeg.Eliminar(id);
                CargarListado();
            }
        }
    }
}