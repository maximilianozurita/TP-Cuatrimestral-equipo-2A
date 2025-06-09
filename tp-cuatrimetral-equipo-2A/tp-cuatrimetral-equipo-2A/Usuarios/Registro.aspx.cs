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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPassword.Text == "" || txtEmail.Text == "")
                {
                    lblMensajeError.Text = "Debe completar todos los campos obligatorios.";
                    lblMensajeError.Visible = true;
                    return;
                }
                UsuarioNegocio usuarioNeg = new UsuarioNegocio();
                if(usuarioNeg.FindActivoByEmail(txtEmail.Text) == null)
                {
                    Usuario usuario = new Usuario();
                    usuario.Email = txtEmail.Text;
                    usuario.Password = txtPassword.Text;

                    usuario.Nombre = txtNombre.Text;
                    usuario.Apellido = txtApellido.Text;
                    usuario.Telefono = txtTelefono.Text;
                    usuario.Direccion = txtDireccion.Text;

                    usuarioNeg.Agregar(usuario, Permisos.Cliente);
                    Response.Redirect("/Usuarios/Login.aspx", false);
                } else
                {
                    lblMensajeError.Text = "Email ya esta registrado.";
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
    }
}