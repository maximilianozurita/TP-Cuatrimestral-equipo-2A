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
    public partial class RecuperarContrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            string email = txtEmailRecuperar.Text.Trim();
            UsuarioNegocio usuerioNeg = new UsuarioNegocio();
            Usuario usuario = usuerioNeg.FindByEmail(email);

            if (usuario != null)
            {
                usuerioNeg.GenerarToken(usuario);

                EmailService emailService = new EmailService();
                emailService.EnviarMailRecuperarContrasena(usuario);
                lblMensaje.Text = "Revisá tu correo para recuperar tu contraseña.";
            }
            else
            {
                lblMensajeError.Text = "Email no registrado.";
            }
        }
    }
}