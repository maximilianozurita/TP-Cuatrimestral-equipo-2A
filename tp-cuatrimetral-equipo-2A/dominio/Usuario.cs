using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Usuario
    {
        public int ID { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Apellido { get; set; } = string.Empty;
        public string Email { get; set; }
        public string Password { get; set; }
        public string Telefono { get; set; } = string.Empty;
        public string Direccion { get; set; } = string.Empty;
        public DateTime FechaAlta { get; set; }
        public DateTime? FechaBaja { get; set; }
        public Permisos Permisos { get; set; } = Permisos.Ninguno;
        public Usuario() { }
        public Usuario(string email, string pass)
        {
            Email = email;
            Password = pass;
        }
        public bool TienePermiso(Permisos permiso) { return (Permisos & permiso) == permiso; }
        public bool AdminTotal()
        {
            var flag = Permisos.AdminUsuario | Permisos.AdminProducto | Permisos.AdminVenta;
            return (Permisos & flag) == flag;
        }
        public bool IsAdmin()
        {
            return TienePermiso(Permisos.AdminUsuario) || TienePermiso(Permisos.AdminProducto) || TienePermiso(Permisos.AdminVenta);
        }
        public bool AdminUsuarios() { return TienePermiso(Permisos.AdminUsuario); }
        public bool AdminProductos() { return TienePermiso(Permisos.AdminProducto); }
        public bool AdminVentas() { return TienePermiso(Permisos.AdminVenta); }
        public bool IsCliente() { return TienePermiso(Permisos.Cliente); }
        public static string Columnas(string alias = "u")
        {
            return $@"{alias}.ID AS UsuarioID,
            {alias}.Nombre AS UsuarioNombre,
            {alias}.Apellido AS UsuarioApellido,
            {alias}.Email AS UsuarioEmail,
            {alias}.Telefono AS UsuarioTelefono,
            {alias}.Direccion AS UsuarioDireccion,
            {alias}.Fecha_alta AS UsuarioFechaAlta,
            {alias}.Fecha_baja AS UsuarioFechaBaja,
            {alias}.Permisos AS UsuarioPermisos";
        }
    }
}