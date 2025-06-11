using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    [Flags]
    public enum Permisos
    {
        Ninguno = 0,
        Prueba = 1,
        Cliente = 2,
        AdminUsuario = 4,
        AdminProducto = 8,
        AdminVenta = 16,
    }

    public class PermisoDesc
    {
        public int Value { get; set; }
        public string Text { get; set; }
        public static List<PermisoDesc> GetPermisosDesc()
        {
            return new List<PermisoDesc>
            {
                new PermisoDesc { Value = (int)Permisos.Cliente, Text = "Cliente" },
                new PermisoDesc { Value = (int)Permisos.AdminUsuario, Text = "Administrar Usuarios" },
                new PermisoDesc { Value = (int)Permisos.AdminProducto, Text = "Administrar Productos" },
                new PermisoDesc { Value = (int)Permisos.AdminVenta, Text = "Administrar Ventas" }
            };
        }
    }
}