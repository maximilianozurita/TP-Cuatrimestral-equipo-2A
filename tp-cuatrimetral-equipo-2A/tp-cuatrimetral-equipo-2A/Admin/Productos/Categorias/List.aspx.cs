using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;
using static negocio.CategoriaNegocio;

namespace tp_cuatrimetral_equipo_2A.Admin.Productos.Categorias
{
    public partial class List : System.Web.UI.Page
    {
        CategoriaNegocio categoriaNeg = new CategoriaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminProducto))
            {
                return;
            }
            if (!IsPostBack)
            {
                ddlEstado.SelectedValue = (EstadoCategoria.Activos).ToString();
                CargarCategorias();
            }
        }

        protected void CargarCategorias()
        {
            var estado = (EstadoCategoria)int.Parse(ddlEstado.SelectedValue);
            rptCategorias.DataSource = categoriaNeg.Listar(estado);
            rptCategorias.DataBind();
        }

        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCategorias();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            categoriaNeg.Eliminar(id);
            CargarCategorias();
        }

        protected void btnRestaurar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            categoriaNeg.DarAlta(id);
            CargarCategorias();
        }
    }
}