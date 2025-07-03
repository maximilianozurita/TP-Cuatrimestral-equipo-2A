using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Venta
    {
        public int ID { get; set; }
        public Usuario Usuario { get; set; }
        public float SumaTotal { get; set; }
        public DateTime FechaVenta { get; set; }
        public bool Confirmada { get; set; } = false;
        public List<VentaProducto> VentaProducto { get; set; } = new List<VentaProducto>();
        public Envio Envio { get; set; }
    }

    public class VentaProducto
    {
        public int Venta_ID { get; set; }
        public Producto Producto { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
    }

}