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
        private UsuarioNegocio usuarioNeg = new UsuarioNegocio();
        private Usuario user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioLogueado = (Usuario)Session["usuario"];
            if (!IsPostBack)
            {
                if (usuarioLogueado != null)
                {
                    user = usuarioNeg.FindActivoByEmail(usuarioLogueado.Email);
                    txtEmail.Text = user.Email;
                    txtNombre.Text = user.Nombre;
                    txtApellido.Text = user.Apellido;
                    txtTelefono.Text = user.Telefono;
                    txtDireccion.Text = user.Direccion;
                    divCambiarPassword.Visible = true;
                }
                else
                {

                    divPassword.Visible = true;
                    divConfirmarPassword.Visible = true;
                }
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuarioLogueado = (Usuario)Session["usuario"];

                if (usuarioLogueado != null)
                {
                    // Para evitar problemas de persistencia con postBack
                    user = usuarioNeg.FindActivoByEmail(usuarioLogueado.Email);
                }
                else if (user == null)
                {
                    user = new Usuario();
                }

                if ((usuarioLogueado == null && string.IsNullOrWhiteSpace(txtPassword.Text)) || string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                    lblMensajeError.Text = "Debe completar todos los campos obligatorios.";
                    lblMensajeError.Visible = true;
                    return;
                }

                if (user == null)
                {
                    user = new Usuario();
                }
                if (PuedeGuardar(usuarioLogueado))
                {
                    user.Email = txtEmail.Text;
                    user.Nombre = txtNombre.Text;
                    user.Apellido = txtApellido.Text;
                    user.Telefono = txtTelefono.Text;
                    user.Direccion = txtDireccion.Text;

                    if (usuarioLogueado != null)
                    {
                        if (chkCambiarPassword.Checked)
                        {
                            if (!ModificarPassword(user.Email)) return;
                        }
                        user.Permisos = usuarioLogueado.Permisos;
                        usuarioNeg.Modificar(user);
                        lblMensajeError.CssClass = "text-success";
                        lblMensajeError.Text = "Datos actualizados correctamente.";
                        lblMensajeError.Visible = true;
                    }
                    else
                    {
                        if (txtPassword.Text != txtConfirmarPassword.Text)
                        {
                            lblMensajeError.Text = "Las contraseñas no coinciden.";
                            lblMensajeError.Visible = true;
                            return;
                        }
                        user.Password = txtPassword.Text;
                        usuarioNeg.Agregar(user, Permisos.Cliente);
                        Response.Redirect("/Usuarios/Login.aspx", false);
                        EmailService emailService = new EmailService();
                        emailService.EnviarMailBienvenida(user.Email);
                    }
                } else
                {
                    return;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("/Error.aspx");
            }
        }
        protected bool PuedeGuardar(Usuario usuarioLogueado)
        {
            Usuario userFinded = usuarioNeg.FindByEmail(txtEmail.Text);
            if (usuarioLogueado != null)
            {
                // Modificación de datos personales
                if (userFinded == null || userFinded.Email == usuarioLogueado.Email)
                {
                    return true;
                }
                else
                {
                    // Email ya usado por otro usuario
                    lblMensajeError.Text = "El email ya está registrado en otra cuenta.";
                    lblMensajeError.Visible = true;
                    return false;
                }
            }
            else
            {
                // Registro nuevo
                if (userFinded == null)
                {
                    return true;
                }
                else
                {
                    // Email ya existe
                    lblMensajeError.Text = "El email ya está registrado.";
                    lblMensajeError.Visible = true;
                    return false;
                }
            }
        }

        protected void chkCambiarPassword_CheckedChanged(object sender, EventArgs e)
        {
            divPassword.Visible = chkCambiarPassword.Checked;
            divConfirmarPassword.Visible = chkCambiarPassword.Checked;
            divPasswordActual.Visible = chkCambiarPassword.Checked;
        }
        protected bool ModificarPassword(string email)
        {
            if (!usuarioNeg.VerificarPassword(email, txtPasswordActual.Text))
            {
                lblMensajeError.Text = "Contraseña actual incorrecta.";
                lblMensajeError.Visible = true;
                return false;
            }

            string nuevaPass = txtPassword.Text;
            string confirmarPass = txtConfirmarPassword.Text;

            if (string.IsNullOrWhiteSpace(nuevaPass) || nuevaPass != confirmarPass)
            {
                lblMensajeError.Text = "Las contraseñas no coinciden o están vacías.";
                lblMensajeError.Visible = true;
                return false;
            }

            usuarioNeg.ModificarPassword(email, nuevaPass);
            return true;
        }
    }
}