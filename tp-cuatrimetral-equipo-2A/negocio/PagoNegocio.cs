using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace negocio
{
    public class PagoNegocio
    {
        public static string ObtenerTokenMercadopago()
        {
            return "APP_USR-5339864898656958-062915-7b25249619821e8e7a437d9b443377f3-1382826563";

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("UPDATE Usuarios SET ResetToken = null, ResetTokenFecha = null WHERE Email = @email");
                datos.SetearParametros("@email", "Admin");
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public static string ObtenerCBU()
        {
            return "micbu";
        }

        public static string ObtenerAlias()
        {
            return "myalias";
        }
    }
}