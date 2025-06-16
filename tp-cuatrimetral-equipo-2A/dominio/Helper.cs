using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using static System.Collections.Specialized.BitVector32;

namespace dominio
{
    public static class Helper
    {
        public static bool VerificarUsuario(HttpSessionState Session, HttpResponse Response, params Permisos[] permisosRequeridos)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("Error", "Acceso denegado, loguear usuario");
                Response.Redirect("/Error.aspx", false);
                return false;
            }
            Usuario usuario = (Usuario)Session["usuario"];

            //Verificar que tenga al menos 1 permiso de los que se necesita para ingresar a la interfaz
            bool tienePermiso = false;
            foreach (var permiso in permisosRequeridos)
            {
                if (usuario.TienePermiso(permiso))
                {
                    tienePermiso = true;
                }
            }
            if (!tienePermiso)
            {
                Session.Add("Error", "Acceso denegado, no tienes permisos para ingresar a esta seccion");
                Response.Redirect("/Error.aspx", false);
                return false;
            }
            return true;
        }
    }
}