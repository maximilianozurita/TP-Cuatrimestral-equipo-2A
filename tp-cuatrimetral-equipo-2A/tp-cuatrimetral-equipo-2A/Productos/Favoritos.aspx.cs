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
                CargarFavoritos();
            }
        }

        private void CargarFavoritos()
        {
            var usuario = Session["usuario"] as Usuario;
            ProductoNegocio productoNeg = new ProductoNegocio();
            var lista = productoNeg.ListarFavoritos(usuario.ID);

            if (lista.Count == 0)
            {
                pnlSinFavoritos.Visible = true;
                rptFavoritos.Visible = false;
            }
            else
            {
                rptFavoritos.DataSource = lista;
                rptFavoritos.DataBind();
            }
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