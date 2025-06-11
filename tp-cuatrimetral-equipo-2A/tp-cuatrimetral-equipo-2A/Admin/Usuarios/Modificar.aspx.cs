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
    public partial class Modificar : System.Web.UI.Page
    {
        private UsuarioNegocio usuarioNeg = new UsuarioNegocio();
        private int idUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null || !((dominio.Usuario)Session["usuario"]).AdminUsuarios())
            {
                Session.Add("Error", "Acceso denegado");
                Response.Redirect("/Error.aspx", false);
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int idUsuario = int.Parse(Request.QueryString["id"]);
                    Usuario usuario = usuarioNeg.FindActivoById(idUsuario);
                    if (usuario != null)
                    {
                        txtEmail.Text = usuario.Email;
                        txtPassword.Text = usuario.Password;
                        txtNombre.Text = usuario.Nombre;
                        txtApellido.Text = usuario.Apellido;
                        txtTelefono.Text = usuario.Telefono;
                        txtDireccion.Text = usuario.Direccion;

                        cblPermisos.DataSource = PermisoDesc.GetPermisosDesc();
                        cblPermisos.DataTextField = "Text";
                        cblPermisos.DataValueField = "Value";
                        cblPermisos.DataBind();
                        SetPermisosUsuario(usuario.Permisos);
                    }
                    else
                    {
                        lblMensajeError.Text = "Usuario no encontrado.";
                        lblMensajeError.Visible = true;
                    }
                }
                else
                {
                    Session.Add("Error", "Usuario no encontrado");
                    Response.Redirect("/Error.aspx", false);
                }
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
        //ToDo: En lugar de modificar password, ver si agregar reestablecer contrasena
            try
            {
                if (txtPassword.Text == "" || txtEmail.Text == "")
                {
                    lblMensajeError.Text = "Debe completar todos los campos obligatorios.";
                    lblMensajeError.Visible = true;
                    return;
                }
                Usuario user = new Usuario();
                user.ID = idUsuario;
                user.Email = txtEmail.Text;
                user.Password = txtPassword.Text;
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.Telefono = txtTelefono.Text;
                user.Direccion = txtDireccion.Text;
                user.Permisos = GetPermisosSeleccionados();

                usuarioNeg.Modificar(user);
                Response.Redirect("/Admin/Usuarios/List.aspx", false);
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = "Error al guardar: " + ex.Message;
                lblMensajeError.Visible = true;
            }
        }
        private Permisos GetPermisosSeleccionados()
        {
            Permisos permisosSeleccionados = Permisos.Ninguno;
            foreach (ListItem item in cblPermisos.Items)
            {
                if (item.Selected)
                {
                    permisosSeleccionados |= (Permisos)int.Parse(item.Value);
                }
            }
            return permisosSeleccionados;
        }
        private void SetPermisosUsuario(Permisos permisosUsuario)
        {
            foreach (ListItem item in cblPermisos.Items)
            {
                int valor = int.Parse(item.Value);
                item.Selected = (permisosUsuario & (Permisos)valor) == (Permisos)valor;
            }
        }
    }
}