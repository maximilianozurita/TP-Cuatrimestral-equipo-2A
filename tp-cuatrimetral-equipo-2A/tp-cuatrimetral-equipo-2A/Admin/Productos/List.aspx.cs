using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;
using static negocio.ProductoNegocio;
using static negocio.UsuarioNegocio;

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
                    ddlEstado.SelectedValue = "0";
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

            var estado = (EstadoProducto)int.Parse(ddlEstado.SelectedValue);
            ProductoNegocio productoNeg = new ProductoNegocio();
            ListaProductos = productoNeg.Listar(false, estado);
            gvProductos.DataSource = ListaProductos;
            gvProductos.DataBind();
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Productos/Form.aspx");
        }


        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarListado();
        }
        protected void gvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(gvProductos.DataKeys[index].Value);
            ProductoNegocio productoNeg = new ProductoNegocio();
            switch (e.CommandName)
            {
                case "Editar":
                    Response.Redirect("/Admin/Productos/Form.aspx?id=" + id);
                    break;

                case "Eliminar":
                    productoNeg.Eliminar(id);
                    break;

                case "Alta":
                    productoNeg.DarAlta(id);
                    break;
            }
            CargarListado();
        }
    }
}