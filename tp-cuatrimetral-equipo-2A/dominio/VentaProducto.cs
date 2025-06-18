using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class VentaProducto
    {
        public int Venta_ID { get; set; }
        public Producto Producto { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
    }
}