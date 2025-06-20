using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimetral_equipo_2A
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["error"] != null)
            {
                lblMensaje.Text = Server.HtmlEncode(Session["error"].ToString());
                Session.Remove("error");
            }
        }
    }
}