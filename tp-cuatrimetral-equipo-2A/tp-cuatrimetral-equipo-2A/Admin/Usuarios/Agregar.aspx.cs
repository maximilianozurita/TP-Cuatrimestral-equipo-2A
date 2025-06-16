using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace tp_cuatrimetral_equipo_2A.Admin.Usuarios
{
    public partial class Agregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Helper.VerificarUsuario(Session, Response, Permisos.AdminUsuario))
            {
                return;
            }
        }
    }
}