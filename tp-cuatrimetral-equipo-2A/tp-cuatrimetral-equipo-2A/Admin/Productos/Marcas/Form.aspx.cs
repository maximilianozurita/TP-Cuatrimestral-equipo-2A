using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A.Admin.Productos.Marcas
{
    public partial class Form : System.Web.UI.Page
    {
        private int? idMarca = null;

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
                    idMarca = id;

                    var MarcaNeg = new MarcaNegocio();
                    var Marca = MarcaNeg.FindById(id);
                    if (Marca != null)
                    {
                        txtNombre.Text = Marca.Nombre;
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

            var Marca = new Marca
            {
                Nombre = txtNombre.Text
            };

            var negocio = new MarcaNegocio();
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id))
            {
                Marca.Id = id;
                negocio.Modificar(Marca);
            }
            else
            {
                negocio.Agregar(Marca);
            }

            Response.Redirect("List.aspx");
        }
    }
}