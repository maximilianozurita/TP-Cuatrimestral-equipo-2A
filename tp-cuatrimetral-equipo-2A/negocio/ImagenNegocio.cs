using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace negocio
{
    public class ImagenNegocio
    {
        public List<Imagen> ListarByProductoId(int producto_id)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Imagen> lista = new List<Imagen>();
            try
            {
                datos.SetearConsulta("select ID, URI from Imagenes where FechaBaja is null and Producto_ID = @producto_id");
                datos.SetearParametros("@producto_id", producto_id);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Imagen imagen = new Imagen
                    {
                        ID = (int)datos.Lector["ID"],
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
                datos.SetearConsulta("Update Imagenes set FechaBaja = GETDATE() WHERE Producto_ID=@id");
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
        public void UpdateByArticulo(Producto producto)
        {
            List<Imagen> imagenesPreCargadas = ListarByProductoId(producto.ID);
            List<string> idsImagenesToAdd = new List<string>();
            List<int> idsImagenesToDelete = new List<int>();

            //Si la imagen no existia en la bd, agregarla
            foreach (Imagen img in producto.Imagenes)
            {
                bool agregar = true;
                foreach (var pre in imagenesPreCargadas)
                {
                    if (img.ID == pre.ID)
                    {
                        agregar = false;
                        break;
                    }
                }

                if (agregar)
                {
                    idsImagenesToAdd.Add(img.ImagenUrl);
                }
            }

            //Si la imagen existe en la bd pero no existe en producto, eliminarla de la bd
            foreach (Imagen pre in imagenesPreCargadas)
            {
                bool eliminar = true;
                foreach (Imagen img in producto.Imagenes)
                {
                    if (pre.ID == img.ID)
                    {
                        eliminar = false;
                        break;
                    }
                }

                if (eliminar)
                {
                    idsImagenesToDelete.Add(pre.ID);
                }
            }
            if (idsImagenesToAdd.Count > 0) AgregarMasivoByArticuloId(producto.ID, idsImagenesToAdd);
            if (idsImagenesToDelete.Count > 0) EliminarMasivoByIds(idsImagenesToDelete);
        }
        public void EliminarMasivoByIds(List<int> ids)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                string query = "Update Imagenes set FechaBaja = GETDATE() where Id in (";
                foreach (int id in ids)
                {
                    query += id + ",";
                }
                query = query.Substring(0, query.Length - 1);
                query += ")";
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
    }
}