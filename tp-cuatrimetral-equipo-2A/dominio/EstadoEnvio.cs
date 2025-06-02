using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class EstadoEnvio
    {
        public int ID { get; set; }
        public string Descripcion { get; set; }
        public DateTime? FechaBaja { get; set; }
    }
}