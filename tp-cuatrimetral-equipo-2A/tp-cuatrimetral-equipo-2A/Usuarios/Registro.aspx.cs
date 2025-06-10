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
                    txtPassword.Text = user.Password;
                    txtNombre.Text = user.Nombre;
                    txtApellido.Text = user.Apellido;
                    txtTelefono.Text = user.Telefono;
                    txtDireccion.Text = user.Direccion;
                }
            }
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
                Usuario usuarioLogueado = (Usuario)Session["usuario"];

                if (user == null)
                {
                    user = new Usuario();
                }
                //ToDo: Agregar a la hora de modificacion de password (verificar password anterior)
                if (PuedeGuardar(usuarioLogueado))
                {
                    user.Email = txtEmail.Text;
                    user.Password = txtPassword.Text;
                    user.Nombre = txtNombre.Text;
                    user.Apellido = txtApellido.Text;
                    user.Telefono = txtTelefono.Text;
                    user.Direccion = txtDireccion.Text;

                    if (usuarioLogueado != null)
                    {
                        usuarioNeg.Modificar(user);
                        lblMensajeError.CssClass = "text-success";
                        lblMensajeError.Text = "Datos actualizados correctamente.";
                        lblMensajeError.Visible = true;
                    }
                    else
                    {
                        usuarioNeg.Agregar(user, Permisos.Cliente);
                        Response.Redirect("/Usuarios/Login.aspx", false);
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
            Usuario userFinded = usuarioNeg.FindActivoByEmail(txtEmail.Text);
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
    }
}