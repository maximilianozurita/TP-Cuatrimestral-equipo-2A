using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A.Admin.Productos.Categorias
{
    public partial class Form : System.Web.UI.Page
    {
        private int? idCategoria = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminProducto))
                {
                    return;
                }
                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id))
                {
                    idCategoria = id;

                    var categoriaNeg = new CategoriaNegocio();
                    var categoria = categoriaNeg.FindById(id);
                    if (categoria != null)
                    {
                        txtNombre.Text = categoria.Nombre;
                        lblTitulo.Text = "Editar Categoría";
                    }
                }
                else
                {
                    lblTitulo.Text = "Nueva Categoría";
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();

            if (string.IsNullOrEmpty(nombre))
            {
                lblError.Text = "El nombre es obligatorio.";
                lblError.Visible = true;
                return;
            }

            var categoria = new Categoria
            {
                Nombre = txtNombre.Text
            };

            var negocio = new CategoriaNegocio();
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id))
            {
                categoria.Id = id;
                negocio.Modificar(categoria);
            }
            else
            {
                negocio.Agregar(categoria);
            }

            Response.Redirect("List.aspx");
        }
    }
}