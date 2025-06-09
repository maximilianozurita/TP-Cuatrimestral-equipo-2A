using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using dominio;
namespace negocio
{
    public class UsuarioNegocio
    {
        public bool Login(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
            //ToDo: Ver de agregar encriptado y desencriptado de password
                datos.SetearConsulta("select ID, Permisos FROM Usuarios where email = @email AND password = @password");
                datos.SetearParametros("@email", usuario.Email);
                datos.SetearParametros("@password", usuario.Password);

                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.ID = (int)datos.Lector["ID"];
                    // Para evitar problemas se parsea a enum Permisos. TryParse(recibe string) en lugar de parse para devolver null en lugar de exception
                    if (Enum.TryParse(datos.Lector["Permisos"].ToString(), out Permisos permisos))
                    {
                        usuario.Permisos = permisos;
                    }
                    else
                    {
                        usuario.Permisos = Permisos.Ninguno;
                    }
                    //Para evitar guardar password en variable session
                    usuario.Password = null;
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public Usuario FindActivoByEmail(string emain)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select ID, Nombre, Apellido, Email, Password, Telefono, Direccion, Permisos, Fecha_alta from Usuarios where Email = @email and Fecha_baja is null");
                datos.SetearParametros("@email", emain);
                datos.EjecutarLectura();
                if (datos.Lector.Read())
                {
                    return InicializarObjeto(datos);
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void Agregar(Usuario usuario, Permisos permisos)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta(@"
                    INSERT INTO Usuarios (Email, Password, Permisos, Nombre, Apellido, Telefono, Direccion)
                    VALUES (@email, @password, @permisos, @nombre, @apellido, @telefono, @direccion)
                ");
                //datos obligatorios
                datos.SetearParametros("@email", usuario.Email);
                datos.SetearParametros("@password", usuario.Password);
                datos.SetearParametros("@permisos", (int)permisos);


                // Datos opcionales
                datos.SetearParametros("@nombre", string.IsNullOrWhiteSpace(usuario.Nombre) ? (object)DBNull.Value : usuario.Nombre);
                datos.SetearParametros("@apellido", string.IsNullOrWhiteSpace(usuario.Apellido) ? (object)DBNull.Value : usuario.Apellido);
                datos.SetearParametros("@telefono", string.IsNullOrWhiteSpace(usuario.Telefono) ? (object)DBNull.Value : usuario.Telefono);
                datos.SetearParametros("@direccion", string.IsNullOrWhiteSpace(usuario.Direccion) ? (object)DBNull.Value : usuario.Direccion);
                datos.EjecutarLectura();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        private Usuario InicializarObjeto(AccesoDatos datos)
        {
            Usuario usuario = new Usuario();
            usuario.ID = (int)datos.Lector["ID"];
            usuario.Email = datos.Lector["Email"].ToString();
            usuario.Password = datos.Lector["Password"].ToString();
            usuario.Nombre = datos.Lector["Nombre"].ToString();
            usuario.Apellido = datos.Lector["Apellido"].ToString();
            usuario.Direccion = datos.Lector["Direccion"].ToString();
            usuario.FechaAlta = (DateTime)datos.Lector["Fecha_alta"];
            return usuario;
        }
    }
}