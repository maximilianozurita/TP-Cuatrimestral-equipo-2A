using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using dominio;

namespace negocio
{
    public class VentaNegocio
    {
        public List<Venta> Listar(int? estadoEnvioId = null)
        {
            List<Venta> lista = new List<Venta>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"
                    SELECT v.ID, v.SumaTotal, v.FechaVenta,
                        " + Usuario.Columnas("u") + @"
                        , e.ID AS EnvioID, e.Estado_envio_ID, e.Estado,
                        ee.Descripcion AS EstadoEnvioDescripcion, ee.FechaBaja AS EstadoEnvioFechaBaja
                    FROM Ventas v
                    JOIN Usuarios u ON (v.Usuario_ID = u.ID)
                    JOIN Envios e ON (e.Venta_ID = v.ID)
                    JOIN Estado_envio ee ON (ee.ID = e.Estado_envio_ID)";
                if (estadoEnvioId != null)
                {
                    consulta += " WHERE e.Estado_envio_ID = @estadoEnvioId";
                }

                datos.SetearConsulta(consulta);

                if (estadoEnvioId != null)
                {
                    datos.SetearParametros("@estadoEnvioId", estadoEnvioId);
                }
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    lista.Add(InicializarObjeto(datos));
                }

                return lista;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public Venta FindByVentaId(int ventaId)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta(@"
                    SELECT v.ID, v.SumaTotal, v.FechaVenta,
                        " + Usuario.Columnas("u") + @"
                        , e.ID AS EnvioID, e.Estado_envio_ID,
                        ee.Descripcion AS EstadoEnvioDescripcion,
                        ee.FechaBaja AS EstadoEnvioFechaBaja
                    FROM Ventas v
                    JOIN Usuarios u ON (v.Usuario_ID = u.ID)
                    JOIN Envios e ON (e.Venta_ID = v.ID)
                    JOIN Estado_envio ee ON (ee.ID = e.Estado_envio_ID) where v.ID = @ventaId");
                datos.SetearParametros("@ventaId", ventaId);
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
        public List<Venta> ListarComprasPorUsuario(int usuarioId)
        {
            List<Venta> lista = new List<Venta>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta(@"
                    SELECT v.ID, v.SumaTotal, v.FechaVenta,
                           e.ID AS Estado_envio_ID, e.Descripcion AS EstadoEnvioDescripcion, e.FechaBaja as EstadoEnvioFechaBaja,
                           en.ID AS EnvioID, 
                          " + Usuario.Columnas("u") + @"
                    FROM Ventas v
                    JOIN Usuarios u ON (u.ID = V.Usuario_ID) 
                    JOIN Envios en ON (en.Venta_ID = v.ID)
                    JOIN Estado_envio e ON (e.ID = en.Estado_envio_ID)
                    WHERE v.Usuario_ID = @usuarioId
                    ORDER BY v.FechaVenta DESC
                ");
                datos.SetearParametros("@usuarioId", usuarioId);
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
        public Venta InicializarObjeto(AccesoDatos datos)
        {
            UsuarioNegocio userNeg = new UsuarioNegocio();
            Venta venta = new Venta();
            venta.ID = (int)datos.Lector["ID"];
            venta.SumaTotal = Convert.ToSingle(datos.Lector["SumaTotal"]);
            venta.FechaVenta = (DateTime)datos.Lector["FechaVenta"];
            venta.Usuario = datos.Lector["usuarioID"] != DBNull.Value ? userNeg.InicializarObjeto(datos) : null;
            venta.VentaProducto = ListarProductosDeVenta((int)datos.Lector["ID"]);
            venta.Estado = datos.Lector["Estado"] is DBNull ? 0 : (int)datos.Lector["Estado"];

            Envio envio = new Envio();
            envio.ID = (int)datos.Lector["EnvioID"];

            EstadoEnvio estadoEnvio = new EstadoEnvio();
            estadoEnvio.ID = (int)datos.Lector["Estado_envio_ID"];
            estadoEnvio.Descripcion = datos.Lector["EstadoEnvioDescripcion"].ToString();
            estadoEnvio.FechaBaja = datos.Lector["EstadoEnvioFechaBaja"] is DBNull ? null : (DateTime?)datos.Lector["EstadoEnvioFechaBaja"];

            envio.EstadoEnvio = estadoEnvio;
            venta.Envio = envio;
            return venta;
        }
        public List<VentaProducto> ListarProductosDeVenta(int ventaId)
        {
            List<VentaProducto> lista = new List<VentaProducto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT vp.Venta_ID, vp.Producto_ID, p.Nombre, vp.Cantidad, vp.PrecioUnitario FROM VentasProducto vp JOIN Productos p ON (vp.Producto_ID = p.ID) WHERE vp.Venta_ID = @ventaId");
                datos.SetearParametros("@ventaId", ventaId);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    VentaProducto vp = new VentaProducto
                    {
                        Venta_ID = (int)datos.Lector["Venta_ID"],
                        Producto = new Producto
                        {
                            ID = (int)datos.Lector["Producto_ID"],
                            Nombre = datos.Lector["Nombre"].ToString()
                        },
                        Cantidad = (int)datos.Lector["Cantidad"],
                        PrecioUnitario = (decimal)datos.Lector["PrecioUnitario"]
                    };

                    lista.Add(vp);
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

        public int CrearVenta(Venta venta)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("INSERT INTO Ventas (Usuario_ID, SumaTotal, FechaVenta) OUTPUT INSERTED.ID VALUES (@usuarioId, @sumaTotal, @fechaVenta)");
                datos.SetearParametros("@usuarioId", venta.Usuario.ID);
                datos.SetearParametros("@sumaTotal", venta.SumaTotal);
                datos.SetearParametros("@fechaVenta", venta.FechaVenta);
                return datos.EjecutarAccionAndReturnId();
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

        public int CambiarEstadoVenta(int ventaId, int estadoEnvioId)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("UPDATE Envios SET Estado_envio_ID = @estadoEnvioId WHERE Venta_ID = @ventaId");
                datos.SetearParametros("@estadoEnvioId", estadoEnvioId);
                datos.SetearParametros("@ventaId", ventaId);
                return datos.EjecutarAccionAndReturnId();
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