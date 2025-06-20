using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A.Usuarios
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAceptar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio usuarioNeg = new UsuarioNegocio();

            try
            {
                usuario = new Usuario(txtEmail.Text, txtContraseña.Text);
                if (usuarioNeg.Login(usuario))
                {
                    Session.Add("usuario", usuario);
                    Session.Add("NombreUsuario", txtEmail.Text);
                    if ((Session["usuario"]) != null)
                    {
                        if (usuario.TienePermiso(Permisos.Cliente))
                        {
                            Response.Redirect("/Default.aspx", false);
                        }
                        else
                        {
                            Response.Redirect("/Admin/Default.aspx", false);
                        }
                    }
                }
                else
                {
                    lblMensajeError.Text = "Verifique su mail o contraseña";
                    lblMensajeError.Visible = true;
                    return;
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");

            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Default.aspx");
        }
    }
}