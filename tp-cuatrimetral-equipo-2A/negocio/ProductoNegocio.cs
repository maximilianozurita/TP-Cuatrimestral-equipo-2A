﻿using dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using static negocio.UsuarioNegocio;

namespace negocio
{
    public class ProductoNegocio
    {
        public enum EstadoProducto { Activos, DadosDeBaja, Todos }
        public List<Producto> Listar(bool? filtrarDestacados = null, EstadoProducto estado = EstadoProducto.Activos)
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = "select a.id , a.Nombre , a.Descripcion , a.Categoria_ID , " +
                    "a.Marca_id , a.precio , a.descuento , a.Destacado, a.FechaBaja, " +
                    "m.Nombre as MarcaNombre , c.Nombre as CategoriaNombre " +
                    "from Productos as a " +
                    "join Categorias as c on c.ID = a.Categoria_ID " +
                    "join Marcas as m on m.ID = a.Marca_ID ";
                if (estado == EstadoProducto.DadosDeBaja)
                {
                    consulta += " WHERE a.FechaBaja is not null";
                }
                else if (estado == EstadoProducto.Activos)
                {
                    consulta += " WHERE a.FechaBaja is null";
                }

                if (filtrarDestacados == true)
                {
                    if(estado == EstadoProducto.Todos)
                    {
                        consulta += " WHERE ";
                    }
                    else
                    {
                        consulta += " and ";
                    }
                        consulta += " a.Destacado = 1";
                }
                datos.SetearConsulta(consulta);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    lista.Add(InicializarObjeto(datos));
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
        public List<Producto> ListarFavoritos(int usuarioId)
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta(@"Select p.ID, p.Nombre, p.Descripcion, p.Precio, p.Descuento, p. Destacado, p.Marca_ID, p.Categoria_ID, p.FechaBaja, 
                    c.Nombre as CategoriaNombre, 
                    m.Nombre as MarcaNombre 
                    from Productos as p 
                    join Favoritos f ON (f.Producto_ID = p.ID) 
                    join CATEGORIAS c on (c.ID = p.Categoria_ID) 
                    join MARCAS m on (m.ID=p.Marca_ID) 
                    where f.Usuario_ID = @usuarioId and p.FechaBaja is null
                ");
                datos.SetearParametros("@usuarioId", usuarioId);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add(InicializarObjeto(datos));
                }

                return lista;
            }
            finally { datos.CerrarConexion(); }
        }
        public void EliminarFavorito(int usuario_id, int producto_id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("Delete from Favoritos where Usuario_ID = @usuario_id and Producto_ID = @producto_id");
                datos.SetearParametros("@usuario_id", usuario_id);
                datos.SetearParametros("@producto_id", producto_id);
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
        public void AgregarFavorito(int usuario_id, int producto_id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("INSERT INTO Favoritos (Usuario_ID, Producto_ID) VALUES (@usuario_id, @producto_id)");
                datos.SetearParametros("@usuario_id", usuario_id);
                datos.SetearParametros("@producto_id", producto_id);
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
        public bool EsFavorito(int usuario_id, int producto_id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("Select 1 from Favoritos where Usuario_ID = @usuario_id and Producto_ID = @producto_id");
                datos.SetearParametros("@usuario_id", usuario_id);
                datos.SetearParametros("@producto_id", producto_id);
                datos.EjecutarLectura();
                return datos.Lector.Read();
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
        public Producto FindById(int id)
        {
            Producto producto = new Producto();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("Select p.ID, p.Nombre, p.Descripcion, p.Precio, p.Descuento, p. Destacado, p.Marca_ID, p.Categoria_ID, p.FechaBaja, c.Nombre as CategoriaNombre, m.Nombre as MarcaNombre from Productos as p join CATEGORIAS c on (c.ID = p.Categoria_ID) join MARCAS m on (m.ID=p.Marca_ID) where p.ID = @id");
                datos.SetearParametros("@Id", id);
                datos.EjecutarLectura();

                if (datos.Lector.Read())
                {
                    producto = InicializarObjeto(datos);
                }
                else
                {
                    return null;
                }
                return producto;
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
        private Producto InicializarObjeto(AccesoDatos datos)
        {
            Producto producto = new Producto();
            producto.ID = (int)datos.Lector["ID"];
            producto.Nombre = datos.Lector["Nombre"].ToString();
            producto.Descuento = float.Parse(datos.Lector["Descuento"].ToString());
            producto.Precio = float.Parse(datos.Lector["Precio"].ToString());
            producto.Descripcion = datos.Lector["Descripcion"].ToString();
            producto.Categoria = new Categoria();
            producto.Marca = new Marca();
            producto.Destacado = (bool)datos.Lector["Destacado"];
            if (datos.Lector["FechaBaja"] == DBNull.Value)
            {
                producto.FechaBaja = null;
            }
            else
            {
                producto.FechaBaja = (DateTime)datos.Lector["FechaBaja"];
            }
            producto.Imagenes = new List<Imagen>();
            if (datos.Lector["Categoria_ID"] != DBNull.Value)
            {
                producto.Categoria.Id = (int)datos.Lector["Categoria_ID"];
                producto.Categoria.Nombre = datos.Lector["CategoriaNombre"].ToString();
            }
            if (datos.Lector["Marca_ID"] != DBNull.Value)
            {
                producto.Marca.Id = (int)datos.Lector["Marca_ID"];
                producto.Marca.Nombre = datos.Lector["MarcaNombre"].ToString();
            }
            producto.Imagenes = new ImagenNegocio().ListarByProductoId(producto.ID);
            producto.CalcularDescuento();
            return producto;
        }

        public Producto ProductoPorId(int id)
        {
            Producto producto = new Producto();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select a.id , a.Nombre , a.Descripcion , a.Categoria_ID , " +
                    "a.Marca_id , a.precio , a.descuento , a.Destacado, a.FechaBaja, " +
                    "m.Nombre as MarcaNombre , c.Nombre as CategoriaNombre " +
                    "from Productos as a " +
                    "inner join Categorias as c on c.ID = a.Categoria_ID " +
                    "inner join Marcas as m on m.ID = a.Marca_ID " +
                    "where a.FechaBaja is null and a.ID = @Id");
                datos.SetearParametros("@Id", id);
                datos.EjecutarLectura();
                if (datos.Lector.Read())
                {
                    producto = InicializarObjeto(datos);
                }
                return producto;
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
        public bool Agregar(Producto producto)
        {

            AccesoDatos accesoDatos = new AccesoDatos();
            ImagenNegocio imgNegocio = new ImagenNegocio();
            try
            {
                string query = @"Insert into Productos (Nombre, Descripcion, Categoria_ID, Marca_ID, Precio, Descuento, Destacado) 
                        values (@Nombre, @Descripcion, @Categoria_ID, @Marca_ID, @Precio, @Descuento, @Destacado);
                        select scope_identity();";

                accesoDatos.SetearConsulta(query);
                accesoDatos.SetearParametros("@Nombre", producto.Nombre);
                accesoDatos.SetearParametros("@Descripcion", producto.Descripcion);
                accesoDatos.SetearParametros("@Categoria_ID", producto.Categoria.Id);
                accesoDatos.SetearParametros("@Marca_ID", producto.Marca.Id);
                accesoDatos.SetearParametros("@Precio", producto.Precio);
                accesoDatos.SetearParametros("@Descuento", producto.Descuento);
                accesoDatos.SetearParametros("@Destacado", producto.Destacado);
                int Producto_ID = accesoDatos.EjecutarAccionAndReturnId();

                if (Producto_ID != 0)
                {
                    List<string> urlsImagenes = producto.Imagenes.Select(img => img.ImagenUrl).ToList();
                    imgNegocio.AgregarMasivoByArticuloId(Producto_ID, urlsImagenes);
                    return true;
                } else
                {
                    return false;
                }
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
        public bool Modificar(Producto producto)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            ImagenNegocio imgNegocio = new ImagenNegocio();
            try
            {
                string query = "Update Productos set Nombre=@nombre, Descripcion=@descripcion, Categoria_ID=@Categoria_ID, Marca_ID=@Marca_ID, Precio=@precio, Descuento=@descuento, Destacado=@destacado where ID=@id";
                accesoDatos.SetearConsulta(query);
                accesoDatos.SetearParametros("@nombre", producto.Nombre);
                accesoDatos.SetearParametros("@descripcion", producto.Descripcion);
                accesoDatos.SetearParametros("@Categoria_ID", producto.Categoria.Id);
                accesoDatos.SetearParametros("@Marca_ID", producto.Marca.Id);
                accesoDatos.SetearParametros("@precio", producto.Precio);
                accesoDatos.SetearParametros("@descuento", producto.Descuento);
                accesoDatos.SetearParametros("@destacado", producto.Destacado);
                accesoDatos.SetearParametros("@id", producto.ID);
                accesoDatos.EjecutarAccion();

                imgNegocio.UpdateByArticulo(producto);
                return true;
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
        public void Eliminar(int producto_id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Eliminar todas las imagenes asociadas al articulo antes de eliminar el articulo
                ImagenNegocio imgNegocio = new ImagenNegocio();
                if (imgNegocio.EliminarByProductoId(producto_id))
                {
                    //Eliminar articulo
                    datos.SetearConsulta("Update Productos set FechaBaja = GETDATE() WHERE Id=@Id");
                    datos.SetearParametros("@Id", producto_id);
                    datos.EjecutarAccion();
                }
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
        public void DarAlta(int producto_id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Dar alta imagenes del producto
                ImagenNegocio imgNegocio = new ImagenNegocio();
                if (imgNegocio.DarAltaByProductoId(producto_id))
                {
                    //Dar de alta producto
                    datos.SetearConsulta("Update Productos set FechaBaja = null WHERE Id=@Id");
                    datos.SetearParametros("@Id", producto_id);
                    datos.EjecutarAccion();
                }
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