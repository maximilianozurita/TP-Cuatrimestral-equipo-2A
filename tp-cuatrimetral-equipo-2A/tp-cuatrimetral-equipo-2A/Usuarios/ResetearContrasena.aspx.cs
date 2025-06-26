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
    public partial class ResetearContrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["email"]) || string.IsNullOrEmpty(Request.QueryString["token"]))
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            string email = Request.QueryString["email"];
            string token = Request.QueryString["token"];
            UsuarioNegocio usuarioNeg = new UsuarioNegocio();

            if (usuarioNeg.AutentificarToken(email, token))
            {
                string nuevaPass = txtNuevaPass.Text;
                string confirmarPass = TextVerificarPass.Text;
                if (string.IsNullOrWhiteSpace(nuevaPass) || nuevaPass != confirmarPass)
                {
                    lblMensajeError.Text = "Las contraseñas no coinciden o están vacías.";
                    lblMensajeError.Visible = true;
                    return;
                }
                usuarioNeg.ModificarPassword(email, nuevaPass);
                usuarioNeg.BorrarToken(email);
                lblMensaje.Text = "Contraseña actualizada correctamente.";
            }
            else
            {
                lblMensaje.Text = "Token inválido o expirado.";
            }
        }
    }
}