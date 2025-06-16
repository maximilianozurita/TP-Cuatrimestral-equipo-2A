using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

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
                        PrecioTotal = 0 // calc mas adelante -- ya me olvide de esto creo que lo resolvi, ver mas adelante
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
                throw new Exception("Error al leer en la base de datos...",ex);
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void GuardarCarritoEnBd(Carrito carrito)
        {
            foreach (ItemCarrito item in carrito.Items)
            {
                if (item.flag_Eliminado)
                {
                    EliminarItemCarrito(item.Id);
                }
                else if (item.Id == 0)
                {
                    InsertarItemCarrito(item, carrito.UsuarioID.Value);
                }
                else if (item.flag_CantidadModificado)
                {
                    ModificarItemCarrito(item);
                }
            }
        }

        private void InsertarItemCarrito(ItemCarrito item, int usuarioId)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("INSERT INTO ItemCarrito " +
                    "(Usuario_ID, Producto_ID, FechaAgregado, Cantidad, Vendido, Cancelado) " +
                    "VALUES (@UsuarioId, @ProductoId, @FechaAgregado, @Cantidad, @Vendido, @Cancelado)");
                datos.SetearParametros("@UsuarioId", usuarioId);
                datos.SetearParametros("@ProductoId", item.Producto.ID);
                datos.SetearParametros("@FechaAgregado", item.FechaAgregado);
                datos.SetearParametros("@Cantidad", item.Cantidad);
                datos.SetearParametros("@Vendido", item.Vendido);
                datos.SetearParametros("@Cancelado", item.Cancelado);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al insertar el item en el carrito", ex);
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        private void ModificarItemCarrito(ItemCarrito item)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("UPDATE ItemCarrito " +
                    "SET Cantidad = @Cantidad WHERE ID = @Id");
                datos.SetearParametros("@Cantidad", item.Cantidad);
                datos.SetearParametros("@Id", item.Id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al modificar el item del carrito", ex);
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        private void EliminarItemCarrito(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("UPDATE ItemCarrito Set Cancelado = 1 Where ID = @Id");
                datos.SetearParametros("@Id", id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar el item del carrito", ex);
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

    }
}