﻿using dominio;
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
    }
}