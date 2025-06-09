using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Carrito
    {
        public int? UsuarioID { get; set; }
        public float SumaTotal { get; private set; }
        public List<ItemCarrito> Items { get; set; } = new List<ItemCarrito>();

        public void AgregarProducto(Producto producto)
        {
            ItemCarrito itemCarrito = Items.Find(i => i.Producto.ID == producto.ID);
            if (itemCarrito != null)
            {
                itemCarrito.Cantidad++;
                itemCarrito.PrecioTotal = itemCarrito.Cantidad * producto.Precio * (1 - producto.Descuento / 100);
            }
            else
            {
                itemCarrito = new ItemCarrito
                {
                    Producto = producto,
                    Cantidad = 1,
                    FechaAgregado = DateTime.Now,
                    PrecioTotal = producto.Precio * (1 - producto.Descuento / 100)
                };
                Items.Add(itemCarrito);
            }
        }

        public void EliminarProducto(int productoId)
        {
            ItemCarrito itemCarrito = Items.Find(i => i.Producto.ID == productoId);
            if (itemCarrito != null)
            {
                Items.Remove(itemCarrito);
            }
        }

        public void DescontarProducto(int productoId)
        {
            ItemCarrito itemCarrito = Items.Find(i => i.Producto.ID == productoId);
            if (itemCarrito != null)
            {
                if (itemCarrito.Cantidad > 1)
                {
                    itemCarrito.Cantidad--;
                    itemCarrito.PrecioTotal = itemCarrito.Cantidad * itemCarrito.Producto.Precio * (1 - itemCarrito.Producto.Descuento / 100);
                }
                else
                {
                    Items.Remove(itemCarrito);
                }
            }
        }

        public Carrito Clonar()
        {
            Carrito clon = new Carrito
            {
                UsuarioID = this.UsuarioID,
                SumaTotal = this.SumaTotal,
                Items = new List<ItemCarrito>(this.Items.Select(item => new ItemCarrito
                {
                    Id = item.Id,
                    Producto = item.Producto,
                    FechaAgregado = item.FechaAgregado,
                    Cantidad = item.Cantidad,
                    PrecioTotal = item.PrecioTotal,
                    Vendido = item.Vendido,
                    Cancelado = item.Cancelado
                }))
            };
            return clon;
        }
    }



    public class ItemCarrito
    {
        public int Id { get; set; }     
        public Producto Producto { get; set; }
        public DateTime FechaAgregado { get; set; }
        public int Cantidad { get; set; } = 1;
        public float PrecioTotal { get; set; } = 0;
        public bool Vendido { get; set; } = false; // Indica si el producto ya fue vendido o no
        public bool Cancelado { get; set; } = false; // Indica si el producto fue cancelado por el usuario
    }



}