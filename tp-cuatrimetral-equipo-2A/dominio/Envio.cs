using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Envio
    {
        public int ID { get; set; }
        public Usuario Usuario { get; set; }
        public Venta Venta { get; set; }
        public EstadoEnvio EstadoEnvio {  get; set; }
    }
}