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
            if (Session["usuario"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                if (usuario.AdminUsuarios())
                {
                    if (!IsPostBack)
                    {
                        List<Usuario> lista = usuarioNeg.Listar();
                        List<Usuario> filtrados = lista.Where(u => !u.Email.Equals(usuario.Email, StringComparison.OrdinalIgnoreCase)).ToList();
                        gvUsuarios.DataSource = filtrados;
                        gvUsuarios.DataBind();
                    }
                }
                else
                {
                    Session.Add("Error", "Acceso denegado, no tienes permisos para ingresar a esta seccion");
                    Response.Redirect("/Error.aspx", false);
                }
            }
            else
            {
                Session.Add("Error", "Acceso denegado, loguear usuario");
                Response.Redirect("/Error.aspx", false);
            }
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

                List<Usuario> lista = usuarioNeg.Listar();
                gvUsuarios.DataSource = lista;
                gvUsuarios.DataBind();
            }
        }
    }
}