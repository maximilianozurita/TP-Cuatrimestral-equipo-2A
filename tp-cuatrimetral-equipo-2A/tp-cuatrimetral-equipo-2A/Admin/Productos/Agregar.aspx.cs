using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A.Admin.Productos
{
    public partial class Agregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminProducto))
                {
                    return;
                }
                if (!IsPostBack)
                {
                    CargarCategorias();
                    CargarMarcas();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Producto producto = new Producto();
                ProductoNegocio productoNeg = new ProductoNegocio();

                producto.Nombre = txtNombre.Text;
                producto.Descripcion = txtDescripcion.Text;
                producto.Precio = (float)decimal.Parse(txtPrecio.Text);
                producto.Descuento = int.Parse(txtDescuento.Text);
                producto.Destacado = chkDestacado.Checked;

                producto.Categoria = new Categoria
                {
                    Id = int.Parse(ddlCategoria.SelectedItem.Value),
                    Nombre = ddlCategoria.SelectedItem.Text,
                };
                producto.Marca = new Marca
                {
                    Id = int.Parse(ddlMarca.SelectedItem.Value),
                    Nombre = ddlMarca.SelectedItem.Text,
                };

                List<Imagen> imagenes = CargarImagenes();
                producto.Imagenes = imagenes;
                if (productoNeg.Agregar(producto))
                {
                    Response.Redirect("/Admin/Productos/List.aspx", false);
                } else
                {
                    lblMensaje.Text = "No se pudo guardar producto";
                    lblMensaje.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.Message);
                Response.Redirect("/Error.aspx", false);
            }
        }
        private List<Imagen> CargarImagenes()
        {
            List<Imagen> imagenes = new List<Imagen>();
            for (int i = 0; i < Request.Files.Count; i++)
            {
                HttpPostedFile archivo = Request.Files[i];
                if (archivo != null && archivo.ContentLength > 0 && archivo.ContentLength < 3932160)
                {
                    if (archivo.ContentType == "image/jpeg" || archivo.ContentType == "image/jpg" || archivo.ContentType == "image/png")
                    {
                        string filename = Path.GetRandomFileName();
                        string extension = Path.GetExtension(archivo.FileName);
                        archivo.SaveAs(Server.MapPath("~/Upload/Products/") + filename + extension);

                        Imagen imagen = new Imagen();
                        imagen.ImagenUrl = filename + extension;
                        imagenes.Add(imagen);
                    }
                }
            }
            return imagenes;
        }
        private void CargarCategorias()
        {
            CategoriaNegocio categoriaNeg = new CategoriaNegocio();
            List<Categoria> listaCategorias = categoriaNeg.Listar();

            ddlCategoria.DataSource = listaCategorias;
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();

            ddlCategoria.Items.Insert(0, new ListItem("-- Seleccionar --", ""));
        }
        private void CargarMarcas()
        {
            MarcaNegocio marcaNeg = new MarcaNegocio();
            List<Marca> listaMarcas = marcaNeg.Listar();

            ddlMarca.DataSource = listaMarcas;
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();

            ddlMarca.Items.Insert(0, new ListItem("-- Seleccionar --", ""));
        }
    }
}