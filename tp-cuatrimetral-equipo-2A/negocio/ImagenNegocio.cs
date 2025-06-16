using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace negocio
{
    public class ImagenNegocio
    {
        public List<Imagen> ListarByArticuloId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Imagen> lista = new List<Imagen>();
            try
            {
                datos.SetearConsulta("select URI, Producto_ID from Imagenes where FechaBaja is null and Producto_ID = @IdArticulo");
                datos.SetearParametros("@IdArticulo", id);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Imagen imagen = new Imagen
                    {
                        ID = (int)datos.Lector["Producto_ID"],
                        ImagenUrl = (string)datos.Lector["URI"]
                    };
                    lista.Add(imagen);
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
        public void AgregarMasivoByArticuloId(int id, List<string> urlImagenes)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                string query = "Insert into Imagenes (Producto_ID,URI) values ";
                foreach (string url in urlImagenes)
                {
                    query += "(" + id + ",'" + url + "'),";
                }
                query = query.Substring(0, query.Length - 1);
                accesoDatos.SetearConsulta(query);
                accesoDatos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.CerrarConexion();
            }
        }
        public bool EliminarByProductoId(int producto_id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("DELETE FROM IMAGENES WHERE Producto_ID=@id");
                datos.SetearParametros("@id", producto_id);
                datos.EjecutarAccion();
                return true;
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