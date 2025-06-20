using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using dominio;

namespace negocio
{
    public class EnvioNegocio
    {
        public List<EstadoEnvio> ListarEstadoEnvios()
        {
            List<EstadoEnvio> lista = new List<EstadoEnvio>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("SELECT ID, Descripcion FROM Estado_envio WHERE FechaBaja IS NULL");
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    EstadoEnvio estadoEnvio = new EstadoEnvio();
                    estadoEnvio.ID = (int)datos.Lector["ID"];
                    estadoEnvio.Descripcion = (string)datos.Lector["Descripcion"];
                    lista.Add(estadoEnvio);
                }
                return lista;
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
        public void ActualizarEstadoEnvio(int ventaId, int nuevoEstadoId)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("UPDATE Envios SET Estado_envio_ID = @idEstado WHERE Venta_ID = @idVenta");
                datos.SetearParametros("@idEstado", nuevoEstadoId);
                datos.SetearParametros("@idVenta", ventaId);
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
    }
}