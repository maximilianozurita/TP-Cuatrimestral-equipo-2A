﻿using System;
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
        public List<Producto> ProductosDeVenta { get; set; } = new List<Producto>();
    }
}