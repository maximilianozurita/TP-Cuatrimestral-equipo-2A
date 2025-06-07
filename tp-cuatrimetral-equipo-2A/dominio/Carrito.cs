using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Carrito
    {
        public int Id { get; set; }         
        public int? UsuarioID { get; set; }
        public float SumaTotal { get; set; }
        public List<ItemCarrito> Items { get; set; } = new List<ItemCarrito>();
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