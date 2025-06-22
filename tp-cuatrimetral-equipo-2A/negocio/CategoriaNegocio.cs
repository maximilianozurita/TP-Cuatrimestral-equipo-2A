using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using dominio;

namespace negocio
{
    public class CategoriaNegocio
    {
        public enum EstadoCategoria { Activos, DadosDeBaja, Todos }
        public List<Categoria> Listar(EstadoCategoria estado = EstadoCategoria.Activos)
        {
            List<Categoria> lista = new List<Categoria>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "Select ID, Nombre, FechaBaja from Categorias";
                if (estado == EstadoCategoria.DadosDeBaja)
                {
                    consulta += " WHERE FechaBaja is not null";
                } else if (estado == EstadoCategoria.Activos)
                {
                    consulta += " WHERE FechaBaja is null";
                }

                datos.SetearConsulta(consulta);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Categoria categoria = new Categoria();
                    categoria.Id = (int)datos.Lector["ID"];
                    categoria.Nombre = (string)datos.Lector["Nombre"];
                    if (datos.Lector["FechaBaja"] == DBNull.Value)
                    {
                        categoria.FechaBaja = null;
                    }
                    else
                    {
                        categoria.FechaBaja = (DateTime)datos.Lector["FechaBaja"];
                    }
                    lista.Add(categoria);
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
        public void Agregar(Categoria categoria)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("INSERT INTO Categorias (Nombre) VALUES (@nombre)");
            datos.SetearParametros("@nombre", categoria.Nombre);
            datos.EjecutarAccion();
        }

        public void Modificar(Categoria categoria)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("UPDATE Categorias SET Nombre = @nombre WHERE ID = @id");
            datos.SetearParametros("@nombre", categoria.Nombre);
            datos.SetearParametros("@id", categoria.Id);
            datos.EjecutarAccion();
        }

        public void Eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("UPDATE Categorias SET FechaBaja = GETDATE() WHERE ID = @id");
            datos.SetearParametros("@id", id);
            datos.EjecutarAccion();
        }
        public void DarAlta(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("UPDATE Categorias SET FechaBaja = NULL WHERE ID = @id");
            datos.SetearParametros("@id", id);
            datos.EjecutarAccion();
        }
        public Categoria FindById(int id)
        {
            Categoria categoria = null;
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("SELECT ID, Nombre FROM Categorias WHERE ID = @id");
            datos.SetearParametros("@id", id);
            datos.EjecutarLectura();
            if (datos.Lector.Read())
            {
                categoria = new Categoria
                {
                    Id = (int)datos.Lector["ID"],
                    Nombre = datos.Lector["Nombre"].ToString()
                };
            }
            datos.CerrarConexion();
            return categoria;
        }
    }
}