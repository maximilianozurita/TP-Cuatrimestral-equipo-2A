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
        public bool CompraUnitaria { get; set; } = false; // Indica si la compra es unitaria o no
        public void AgregarProducto(Producto producto, int cantidad)
        {
            ItemCarrito itemCarrito = Items.Find(i => i.Producto.ID == producto.ID);
            if (itemCarrito != null)
            {
                this.ModificarCantidad(producto.ID, cantidad);
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
            CalcularSumaTotal();
        }
        public void EliminarProducto(int productoId)
        {
            ItemCarrito itemCarrito = Items.Find(i => i.Producto.ID == productoId);
            if (itemCarrito != null)
            {
                itemCarrito.Cantidad = 0;
                itemCarrito.flag_Eliminado = true;
            }
            CalcularSumaTotal();
        }
        public void ModificarCantidad(int productoId,int cantidad)
        {
            ItemCarrito itemCarrito = Items.Find(i => i.Producto.ID == productoId);
            if (itemCarrito != null)
            {
                itemCarrito.Cantidad += cantidad;
                if (itemCarrito.Cantidad > 0)
                {
                    itemCarrito.flag_CantidadModificado = true; // Marca el producto como descontado
                    itemCarrito.PrecioTotal = itemCarrito.Cantidad * itemCarrito.Producto.PrecioConDescuento;
                }
                else if (itemCarrito.Cantidad <= 0)
                {
                    itemCarrito.Cantidad = 0;
                    itemCarrito.flag_Eliminado = true;  // Elimina el producto del carrito
                    itemCarrito.PrecioTotal = 0;
                }
            }
            CalcularSumaTotal();
        }
        public void AgregarUnidad(int productId)
        {
            this.ModificarCantidad(productId, 1);
            CalcularSumaTotal();
        }
        public void QuitarUnidad(int productId)
        {
            this.ModificarCantidad(productId, -1);
            CalcularSumaTotal();
        }
        public void MarcarTodoEliminado()
        {
            foreach (ItemCarrito item in Items)
            {
                item.flag_Eliminado = true;
                item.Cantidad = 0;
                item.PrecioTotal = 0;
            }
            CalcularSumaTotal();
        }
        private void CalcularSumaTotal()
        {
            this.SumaTotal = 0;
            foreach (ItemCarrito item in Items)
            {
                if (!item.flag_Eliminado && !item.Cancelado)
                {
                    this.SumaTotal += item.PrecioTotal * item.Cantidad;
                }
            }
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

        public bool flag_Eliminado { get; set; } = false; // Indica si el producto fue eliminado del carrito por el usuario
        public bool flag_CantidadModificado { get; set; } = false; // Indica si el producto fue descontado del carrito por el usuario
        public bool flag_NuevoProducto { get; set; } = false; // Indica si el producto fue agregado al carrito por el usuario
    }

}