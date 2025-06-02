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
        public int SumaTotal { get; set; }
        public DateTime FechaVenta { get; set; }
    }
}