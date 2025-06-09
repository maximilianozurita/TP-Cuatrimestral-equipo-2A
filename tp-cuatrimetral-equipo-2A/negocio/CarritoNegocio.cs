using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace negocio
{
    public class CarritoNegocio
    {
        public Carrito CarritoPorUsuarioID(int UsuarioId)
        {
            AccesoDatos datos = new AccesoDatos();
            List<ItemCarrito> lista = new List<ItemCarrito>();
            Carrito carrito = new Carrito();
            try
            {
                datos.SetearConsulta("select ID,Usuario_ID,Producto_ID,FechaAgregado,Cantidad,Vendido,Cancelado from ItemCarrito where Usuario_ID = @UsuarioId");
                datos.SetearParametros("@UsuarioId", UsuarioId);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    ItemCarrito item = new ItemCarrito
                    {
                        Id = (int)datos.Lector["Id"],
                        Producto = new Producto { ID = (int)datos.Lector["Producto_ID"] },
                        FechaAgregado = (DateTime)datos.Lector["FechaAgregado"],
                        Cantidad = (int)datos.Lector["Cantidad"],
                        Vendido = (bool)datos.Lector["Vendido"],
                        Cancelado = (bool)datos.Lector["Cancelado"],
                        PrecioTotal = 0 // calc mas adelante
                    };
                    lista.Add(item);
                }
                if (lista.Count > 0)
                {
                    carrito.Items = lista;
                    carrito.UsuarioID = UsuarioId;
                }
                else
                {
                    carrito = null;
                }
                return carrito;
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
        public void AgregarItemCarrito(ItemCarrito item)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into ItemCarrito (Usuario_ID, Producto_ID, FechaAgregado, Cantidad, Vendido, Cancelado) " +
                    "values (@UsuarioId, @ProductoId, @FechaAgregado, @Cantidad, @Vendido, @Cancelado)");
                datos.SetearParametros("@UsuarioId", item.Producto.ID);
                datos.SetearParametros("@ProductoId", item.Producto.ID);
                datos.SetearParametros("@FechaAgregado", item.FechaAgregado);
                datos.SetearParametros("@Cantidad", item.Cantidad);
                datos.SetearParametros("@Vendido", item.Vendido);
                datos.SetearParametros("@Cancelado", item.Cancelado);
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