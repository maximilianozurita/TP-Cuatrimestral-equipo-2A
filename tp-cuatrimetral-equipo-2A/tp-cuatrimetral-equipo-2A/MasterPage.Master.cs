﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimetral_equipo_2A
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_cerrar_sesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Usuarios/Login.aspx");
        }
    }
}