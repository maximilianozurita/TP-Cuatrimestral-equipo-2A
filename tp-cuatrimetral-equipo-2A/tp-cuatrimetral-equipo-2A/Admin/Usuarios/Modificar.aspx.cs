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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminUsuario))
            {
                return;
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int idUsuario = int.Parse(Request.QueryString["id"]);
                    Usuario usuario = usuarioNeg.FindById(idUsuario);
                    if (usuario != null)
                    {
                        Session.Add("idUsuario", idUsuario);
                        txtEmail.Text = usuario.Email;
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
            try
            {
                if (txtEmail.Text == "")
                {
                    lblMensajeError.Text = "Debe completar todos los campos obligatorios.";
                    lblMensajeError.Visible = true;
                    return;
                }
               
                Usuario user = new Usuario();
                user.ID = (int)Session["idUsuario"];
                user.Email = txtEmail.Text;
                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;
                user.Telefono = txtTelefono.Text;
                user.Direccion = txtDireccion.Text;
                user.Permisos = GetPermisosSeleccionados();

                usuarioNeg.Modificar(user);
                Response.Redirect("/Admin/Usuarios/List.aspx", false);
                Session.Remove("idUsuario");
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

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Usuarios/List.aspx");
        }
    }
}