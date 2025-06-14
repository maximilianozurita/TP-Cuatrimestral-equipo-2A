﻿using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace negocio
{
    public class ProductoNegocio
    {
        public List<Producto> Listar()
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("select a.id , a.Nombre , a.Descripcion , a.Categoria_ID , " +
                    "a.Marca_id , a.precio , a.descuento , " +
                    "m.Nombre as MarcaNombre , c.Nombre as CategoriaNombre " +
                    "from Productos as a " +
                    "inner join Categorias as c on c.ID = a.Categoria_ID " +
                    "inner join Marcas as m on m.ID = a.Marca_ID " +
                    "where a.FechaBaja is null");
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
            producto.Imagen = new List<Imagen>();
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
            producto.Imagen = new ImagenNegocio().ListarByArticuloId(producto.ID);
            return producto;
        }

        public Producto ProductoPorId(int id)
        {
            Producto producto = new Producto();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select a.id , a.Nombre , a.Descripcion , a.Categoria_ID , " +
                    "a.Marca_id , a.precio , a.descuento , " +
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
    }
}