using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public enum Permisos
    {
        Ninguno = 0,
        Prueba = 1,
        Cliente = 2,
        AdministrarUsuarios = 4,
        AdministrarProductos = 8,
        AdministrarVentas = 16,
        Mask = 31,
    }
    public class Permiso
    {
        public int ID { get; set; }
        public int BitWise { get; set; }
        public string Codigo { get; set; }
        public DateTime? FechaBaja { get; set; }
    }
}