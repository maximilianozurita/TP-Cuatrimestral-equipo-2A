using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Usuario
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public DateTime FechaAlta { get; set; }
        public DateTime? FechaBaja { get; set; }
        public Permisos Permisos { get; set; } = Permisos.Ninguno;
        public bool TienePermiso(Permisos permiso) { return (Permisos & permiso) == permiso; }
        public bool AdminTotal()
        {
            var flag = Permisos.AdministrarUsuarios | Permisos.AdministrarProductos | Permisos.AdministrarVentas;
            return (Permisos & flag) == flag;
        }
        public bool AdminUsuarios() { return TienePermiso(Permisos.AdministrarUsuarios); }
        public bool AdminProductos() { return TienePermiso(Permisos.AdministrarProductos); }
        public bool AdminVentas() { return TienePermiso(Permisos.AdministrarVentas); }
    }
}