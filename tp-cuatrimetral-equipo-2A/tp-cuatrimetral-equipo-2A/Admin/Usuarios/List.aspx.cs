using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;
using static negocio.CategoriaNegocio;
using static negocio.UsuarioNegocio;

namespace tp_cuatrimetral_equipo_2A.Admin.Usuarios
{
    public partial class List : System.Web.UI.Page
    {
        private UsuarioNegocio usuarioNeg = new UsuarioNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminUsuario))
            {
                return;
            }

            if (!IsPostBack)
            {
                ddlEstado.SelectedValue = ((int)EstadoUsuario.Todos).ToString();
                CargarUsuarios();
            }
        }
        private void CargarUsuarios()
        {
            var estado = (EstadoUsuario)int.Parse(ddlEstado.SelectedValue);
            List<Usuario> lista = usuarioNeg.Listar(estado);

            Usuario usuarioLogueado = (Usuario)Session["usuario"];
            lista = lista.Where(u => u.Email != usuarioLogueado.Email).ToList();

            gvUsuarios.DataSource = lista;
            gvUsuarios.DataBind();
        }
        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int idUsuario = Convert.ToInt32(gvUsuarios.DataKeys[index].Value);

            switch (e.CommandName)
            {
                case "Modificar":
                    Response.Redirect("Modificar.aspx?id=" + idUsuario);
                    break;
                case "Baja":
                    usuarioNeg.Borrar(idUsuario);
                    break;
                case "Alta":
                    usuarioNeg.DarAlta(idUsuario);
                    break;
            }
            CargarUsuarios();
        }
        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarUsuarios();
        }
    }
}