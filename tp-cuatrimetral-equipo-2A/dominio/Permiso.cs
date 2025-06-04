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
        AdministrarUsuarios = 4,
        AdministrarProductos = 8,
        AdministrarVentas = 16,
        Mask = 31,
    }
}