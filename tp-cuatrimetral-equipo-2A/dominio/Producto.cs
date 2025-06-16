using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Producto
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public Categoria Categoria { get; set; }
        public Marca Marca { get; set; }
        public float Precio { get; set; }
        public List<Imagen> Imagenes { get; set; }
        public float Descuento { get; set; }
        public bool Destacado { get; set; }
        public DateTime? FechaBaja { get; set; }
    }
}