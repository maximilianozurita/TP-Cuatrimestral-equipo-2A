using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

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
                gvUsuarios.DataSource = getListaSinUsuarioLogueado();
                gvUsuarios.DataBind();
            }
        }
        protected List<Usuario> getListaSinUsuarioLogueado()
        {
            Usuario usuario = (Usuario)Session["usuario"];
            List<Usuario> lista = usuarioNeg.Listar();
            List<Usuario> filtrados = lista.Where(u => !u.Email.Equals(usuario.Email, StringComparison.OrdinalIgnoreCase)).ToList();
            return filtrados;
        }
        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int idUsuario = Convert.ToInt32(gvUsuarios.DataKeys[index].Value);
            if (e.CommandName == "Modificar")
            {
                Response.Redirect("Modificar.aspx?id=" + idUsuario);
            }

            if (e.CommandName == "Baja")
            {
                usuarioNeg.Borrar(idUsuario);
                gvUsuarios.DataSource = getListaSinUsuarioLogueado();
                gvUsuarios.DataBind();
            }
        }
    }
}