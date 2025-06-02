using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Favoritos
    {
        public int ID { get; set; }
        public Producto Producto { get; set; }
        public Usuario Usuario { get; set; }
    }
}