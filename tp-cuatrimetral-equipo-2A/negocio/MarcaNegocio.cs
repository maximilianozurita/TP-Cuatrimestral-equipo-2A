using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using dominio;

namespace negocio
{
    public class MarcaNegocio
    {
        public enum EstadoMarca { Activos, DadosDeBaja, Todos }
        public List<Marca> Listar(EstadoMarca estado = EstadoMarca.Activos)
        {
            List<Marca> lista = new List<Marca>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "Select ID, Nombre, FechaBaja from Marcas";
                if (estado == EstadoMarca.DadosDeBaja)
                {
                    consulta += " WHERE FechaBaja is not null";
                }
                else if (estado == EstadoMarca.Activos)
                {
                    consulta += " WHERE FechaBaja is null";
                }

                datos.SetearConsulta(consulta);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Marca categoria = new Marca();
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
        public void Agregar(Marca categoria)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("INSERT INTO Marcas (Nombre) VALUES (@nombre)");
            datos.SetearParametros("@nombre", categoria.Nombre);
            datos.EjecutarAccion();
        }

        public void Modificar(Marca categoria)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("UPDATE Marcas SET Nombre = @nombre WHERE ID = @id");
            datos.SetearParametros("@nombre", categoria.Nombre);
            datos.SetearParametros("@id", categoria.Id);
            datos.EjecutarAccion();
        }

        public void Eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("UPDATE Marcas SET FechaBaja = GETDATE() WHERE ID = @id");
            datos.SetearParametros("@id", id);
            datos.EjecutarAccion();
        }
        public void DarAlta(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("UPDATE Marcas SET FechaBaja = NULL WHERE ID = @id");
            datos.SetearParametros("@id", id);
            datos.EjecutarAccion();
        }
        public Marca FindById(int id)
        {
            Marca categoria = null;
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("SELECT ID, Nombre FROM Marcas WHERE ID = @id");
            datos.SetearParametros("@id", id);
            datos.EjecutarLectura();
            if (datos.Lector.Read())
            {
                categoria = new Marca
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