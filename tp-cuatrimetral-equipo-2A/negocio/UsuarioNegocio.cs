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
    }
}