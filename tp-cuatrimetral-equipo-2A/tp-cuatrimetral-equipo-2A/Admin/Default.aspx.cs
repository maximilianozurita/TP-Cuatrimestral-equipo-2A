using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace tp_cuatrimetral_equipo_2A.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Helper.VerificarUsuario(Session, Response, Permisos.AdminVenta, Permisos.AdminProducto, Permisos.AdminUsuario);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
        }
    }
}