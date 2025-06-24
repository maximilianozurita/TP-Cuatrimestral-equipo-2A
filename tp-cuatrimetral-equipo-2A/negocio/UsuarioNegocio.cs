using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using dominio;
namespace negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> Listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT " + Usuario.Columnas("u") + " FROM Usuarios u WHERE Fecha_baja is null";
                datos.SetearConsulta(consulta);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    lista.Add(InicializarObjeto(datos));
                }
                return lista;
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
        public bool Login(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
            //ToDo: Ver de agregar encriptado y desencriptado de password
                datos.SetearConsulta("select ID, Permisos FROM Usuarios where email = @email AND password = @password and Fecha_baja is null");
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
        public Usuario FindAllByEmail(string emain)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select " + Usuario.Columnas("u") + " from Usuarios u where Email = @email");
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
        public Usuario FindActivoByEmail(string emain)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select " + Usuario.Columnas("u") + " from Usuarios u where Email = @email and Fecha_baja is null");
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
        public Usuario FindActivoById(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("select " + Usuario.Columnas("u") + " from Usuarios u where ID = @id and Fecha_baja is null");
                datos.SetearParametros("@id", id);
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
        public bool VerificarPassword(string email, string password)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("SELECT 1 FROM Usuarios WHERE Email = @Email AND Password = @Password");
                datos.SetearParametros("@Email", email);
                datos.SetearParametros("@Password", password);
                datos.EjecutarLectura();

                return datos.Lector.Read();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al verificar la contraseña", ex);
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void ModificarPassword(string email, string password)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("UPDATE Usuarios SET Password = @password WHERE Email = @email");

                datos.SetearParametros("@password", password);
                datos.SetearParametros("@email", email);
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
        public void Modificar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta(@"
                    UPDATE Usuarios
                    SET
                        Email = @email,
                        Nombre = @nombre,
                        Apellido = @apellido,
                        Telefono = @telefono,
                        Direccion = @direccion,
                        Permisos = @permisos
                    WHERE Email = @email;
                ");

                datos.SetearParametros("@email", usuario.Email);
                datos.SetearParametros("@nombre", string.IsNullOrWhiteSpace(usuario.Nombre) ? (object)DBNull.Value : usuario.Nombre);
                datos.SetearParametros("@apellido", string.IsNullOrWhiteSpace(usuario.Apellido) ? (object)DBNull.Value : usuario.Apellido);
                datos.SetearParametros("@telefono", string.IsNullOrWhiteSpace(usuario.Telefono) ? (object)DBNull.Value : usuario.Telefono);
                datos.SetearParametros("@direccion", string.IsNullOrWhiteSpace(usuario.Direccion) ? (object)DBNull.Value : usuario.Direccion);
                datos.SetearParametros("@permisos", (int)usuario.Permisos);
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
        public void Borrar(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("UPDATE Usuarios SET Fecha_baja = GETDATE() WHERE ID = @id");
                datos.SetearParametros("@id", id);
                datos.EjecutarAccion();
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

        public Usuario InicializarObjeto(AccesoDatos datos)
        {
            Usuario usuario = new Usuario();
            usuario.ID = (int)datos.Lector["UsuarioID"];
            usuario.Email = datos.Lector["UsuarioEmail"].ToString();
            usuario.Nombre = datos.Lector["UsuarioNombre"].ToString();
            usuario.Telefono = datos.Lector["UsuarioTelefono"].ToString();
            usuario.Apellido = datos.Lector["UsuarioApellido"].ToString();
            usuario.Direccion = datos.Lector["UsuarioDireccion"].ToString();
            usuario.Permisos = (Permisos)(int)datos.Lector["UsuarioPermisos"];
            usuario.FechaAlta = (DateTime)datos.Lector["UsuarioFechaAlta"];
            if (datos.Lector["UsuarioFechaBaja"] == DBNull.Value)
            {
                usuario.FechaBaja = null;
            }
            else
            {
                usuario.FechaBaja = (DateTime)datos.Lector["UsuarioFechaBaja"];
            }
            return usuario;
        }
    }
}