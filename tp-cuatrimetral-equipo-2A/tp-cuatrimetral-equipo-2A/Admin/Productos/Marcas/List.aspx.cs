using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;
using static negocio.MarcaNegocio;

namespace tp_cuatrimetral_equipo_2A.Admin.Productos.Marcas
{
    public partial class List : System.Web.UI.Page
    {
        MarcaNegocio MarcaNeg = new MarcaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminProducto))
            {
                return;
            }
            if (!IsPostBack)
            {
                ddlEstado.SelectedValue = (EstadoMarca.Activos).ToString();
                CargarMarcas();
            }
        }

        protected void CargarMarcas()
        {
            var estado = (EstadoMarca)int.Parse(ddlEstado.SelectedValue);
            rptMarcas.DataSource = MarcaNeg.Listar(estado);
            rptMarcas.DataBind();
        }

        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarMarcas();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            MarcaNeg.Eliminar(id);
            CargarMarcas();
        }

        protected void btnRestaurar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            MarcaNeg.DarAlta(id);
            CargarMarcas();
        }
    }
}