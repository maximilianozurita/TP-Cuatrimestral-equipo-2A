using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Carrito
    {
        public int Id { get; set; }
        public Usuario Usuario { get; set; }
        public Producto Producto { get; set; }
        public int Cantidad { get; set; }
        public float Precio { get; set; }
        public Venta Venta { get; set; }
    }
}