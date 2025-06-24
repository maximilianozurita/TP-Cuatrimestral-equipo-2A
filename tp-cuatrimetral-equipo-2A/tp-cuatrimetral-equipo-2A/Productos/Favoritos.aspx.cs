using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimetral_equipo_2A.Productos
{
    public partial class Favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Helper.VerificarUsuario(Session, Response, Permisos.Cliente))
                {
                    return;
                }
                CargarFiltros();
                CargarFavoritos();
            }
        }

        private void CargarFavoritos()
        {
            var usuario = Session["usuario"] as Usuario;
            ProductoNegocio productoNeg = new ProductoNegocio();
            var lista = productoNeg.ListarFavoritos(usuario.ID);

            if (!string.IsNullOrEmpty(txtNombre.Text))
            {
                lista = lista.Where(p => p.Nombre.ToLower().Contains(txtNombre.Text.ToLower())).ToList();
            }

            if (ddlMarca.SelectedValue != "0")
            {
                lista = lista.Where(p => p.Marca.Id.ToString() == ddlMarca.SelectedValue).ToList();
            }

            if (ddlCategoria.SelectedValue != "0")
            { 
                lista = lista.Where(p => p.Categoria.Id.ToString() == ddlCategoria.SelectedValue).ToList();
            }

            switch (ddlOrden.SelectedValue)
            {
                case "PrecioAsc":
                    lista = lista.OrderBy(p => p.PrecioConDescuento).ToList();
                    break;
                case "PrecioDesc":
                    lista = lista.OrderByDescending(p => p.PrecioConDescuento).ToList();
                    break;
                case "Descuento":
                    lista = lista.OrderByDescending(p => p.Descuento).ToList();
                    break;
            }

            if (lista.Count == 0)
            {
                pnlSinFavoritos.Visible = true;
                rptFavoritos.Visible = false;
            }
            else
            {
                rptFavoritos.DataSource = lista;
                rptFavoritos.DataBind();
                rptFavoritos.Visible = true;
                pnlSinFavoritos.Visible = false;
            }
        }
        private void CargarFiltros()
        {
            CategoriaNegocio categoriaNeg = new CategoriaNegocio();
            ddlCategoria.DataSource = categoriaNeg.Listar();
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();
            ddlCategoria.Items.Insert(0, new ListItem("Todas", "0"));

            MarcaNegocio marcaNeg = new MarcaNegocio();
            ddlMarca.DataSource = marcaNeg.Listar();
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
            ddlMarca.Items.Insert(0, new ListItem("Todas", "0"));
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            CargarFavoritos();
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            var usuario = Session["usuario"] as Usuario;
            if (usuario == null)
            {
                return;
            }

            var btn = (Button)sender;
            int productoId = int.Parse(btn.CommandArgument);
            ProductoNegocio productoNeg = new ProductoNegocio();
            productoNeg.EliminarFavorito(usuario.ID, productoId);
            CargarFavoritos();
        }
    }
}