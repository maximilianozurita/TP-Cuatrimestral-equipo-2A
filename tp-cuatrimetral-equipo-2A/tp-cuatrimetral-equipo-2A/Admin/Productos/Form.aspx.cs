﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mime;
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
                if (!IsPostBack)
                {
                    if (!Helper.VerificarUsuario(Session, Response, Permisos.AdminProducto))
                    {
                        return;
                    }

                    CargarCategorias();
                    CargarMarcas();

                    if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id))
                    {
                        CargarProducto(id);
                        btnGuardar.Text = "Modificar Producto";
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }

        private void CargarProducto(int id)
        {
            ProductoNegocio productoNeg = new ProductoNegocio();
            Producto producto = productoNeg.FindById(id);
            ImagenNegocio imagenNeg = new ImagenNegocio();

            if (producto != null)
            {
                txtNombre.Text = producto.Nombre;
                txtDescripcion.Text = producto.Descripcion;
                txtPrecio.Text = producto.Precio.ToString();
                txtDescuento.Text = producto.Descuento.ToString();
                chkDestacado.Checked = producto.Destacado;
                ddlCategoria.SelectedValue = producto.Categoria.Id.ToString();
                ddlMarca.SelectedValue = producto.Marca.Id.ToString();


                List<Imagen> imagenes = imagenNeg.ListarByProductoId(id);
                rptImagenes.DataSource = imagenes;
                rptImagenes.DataBind();
                Session.Add("producto_id", producto.ID);
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Validar())
                {
                    return;
                }
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
                if (imagenes.Count == 0)
                {
                    lblMensaje.Text = "Se requiere agregar al menos 1 imagen.";
                    lblMensaje.Visible = true;
                    return;
                }
                producto.Imagenes = imagenes;

                if (Session["producto_id"] != null)
                {
                    producto.ID = (int)Session["producto_id"];
                    if (productoNeg.Modificar(producto))
                    {
                        Response.Redirect("/Admin/Productos/List.aspx", false);
                    }
                    else
                    {
                        lblMensaje.Text = "No se pudo modificar producto";
                        lblMensaje.Visible = true;
                    }
                    Session.Remove("producto_id");
                }
                else
                {
                    if (productoNeg.Agregar(producto))
                    {
                        Response.Redirect("/Admin/Productos/List.aspx", false);
                    }
                    else
                    {
                        lblMensaje.Text = "No se pudo agregar producto";
                        lblMensaje.Visible = true;
                    }
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
                    string extension = Path.GetExtension(archivo.FileName).ToLower();
                    string contentType = archivo.ContentType;
                    if ((extension == ".jpg" || extension == ".jpeg" || extension == ".png" || extension == ".webp") &&
                    (contentType == "image/jpeg" || contentType == "image/jpg" || contentType == "image/png" || contentType == "image/webp"))
                    {
                        string filename = Path.GetRandomFileName();
                        archivo.SaveAs(Server.MapPath("~/Upload/Products/") + filename + extension);
                        Imagen imagen = new Imagen();
                        imagen.ImagenUrl = filename + extension;
                        imagenes.Add(imagen);
                    }
                }
            }
            GetImagenesSinEliminar(imagenes);
            return imagenes;
        }
        private void GetImagenesSinEliminar(List <Imagen> imagenes)
        {

            foreach (RepeaterItem item in rptImagenes.Items)
            {
                CheckBox chkEliminar = item.FindControl("chkEliminar") as CheckBox;
                HiddenField hfIdImagen = item.FindControl("hfIdImagen") as HiddenField;
                HiddenField hfUrlImagen = item.FindControl("hfUrlImagen") as HiddenField;

                if (chkEliminar != null && hfIdImagen != null && hfUrlImagen != null)
                {
                    int id;
                    if (int.TryParse(hfIdImagen.Value, out id) && !chkEliminar.Checked)
                    {
                        imagenes.Add(new Imagen
                        {
                            ID = id,
                            ImagenUrl = hfUrlImagen.Value
                        });
                    }
                }
            }
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

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Productos/List.aspx");
        }
        private bool Validar()
        {
            string mensajeError = "";

            if (string.IsNullOrWhiteSpace(txtNombre.Text) || txtNombre.Text.Length < 3)
            {
                mensajeError += "El nombre es obligatorio y debe tener al menos 3 caracteres.<br/>";
            }

            if (string.IsNullOrWhiteSpace(txtDescripcion.Text) || txtDescripcion.Text.Length < 10)
            {
                mensajeError += "La descripción es obligatoria y debe tener al menos 10 caracteres.<br/>";
            }

            if (string.IsNullOrWhiteSpace(txtPrecio.Text) || !decimal.TryParse(txtPrecio.Text, out decimal precio) || precio <= 0)
            {
                mensajeError += "El precio es obligatorio y debe ser mayor a 0.<br/>";
            }

            if (string.IsNullOrWhiteSpace(txtDescuento.Text) || !int.TryParse(txtDescuento.Text, out int descuento) || descuento < 0 || descuento > 100)
            {
                mensajeError += "El descuento debe ser un número entre 0 y 100.<br/>";
            }

            if (string.IsNullOrEmpty(ddlCategoria.SelectedValue))
            {
                mensajeError += "Debe seleccionar una categoría.<br/>";
            }

            if (string.IsNullOrEmpty(ddlMarca.SelectedValue))
            {
                mensajeError += "Debe seleccionar una marca.<br/>";
            }
            if (!string.IsNullOrEmpty(mensajeError))
            {
                lblMensaje.Text = mensajeError;
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Visible = true;
                return false;
            }
            return true;
        }
    }
}