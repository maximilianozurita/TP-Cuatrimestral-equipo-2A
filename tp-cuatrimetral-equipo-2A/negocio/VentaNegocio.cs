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
                    SELECT 
                        v.ID, v.SumaTotal, v.FechaVenta,
                        u.ID AS UsuarioID, u.Email,
                        e.ID AS EnvioID, e.Estado_envio_ID,
                        ee.Descripcion AS EstadoEnvioDescripcion,
                        ee.FechaBaja AS EstadoEnvioFechaBaja
                    FROM Ventas v
                    JOIN Usuarios u ON (v.Usuario_ID = u.ID)
                    LEFT JOIN Envios e ON (e.Venta_ID = v.ID)
                    LEFT JOIN Estado_envio ee ON (ee.ID = e.Estado_envio_ID)";
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
                    Venta venta = new Venta
                    {
                        ID = (int)datos.Lector["ID"],
                        SumaTotal = Convert.ToSingle(datos.Lector["SumaTotal"]),
                        FechaVenta = (DateTime)datos.Lector["FechaVenta"],
                        Usuario = new Usuario
                        {
                            ID = (int)datos.Lector["UsuarioID"],
                            Email = datos.Lector["Email"].ToString()
                        },
                        VentaProducto = CargarProductosDeVenta((int)datos.Lector["ID"]),
                        Envio = datos.Lector["EnvioID"] != DBNull.Value ? 
                        new Envio {
                            ID = (int)datos.Lector["EnvioID"],
                            EstadoEnvio = new EstadoEnvio
                            {
                                ID = (int)datos.Lector["Estado_envio_ID"],
                                Descripcion = datos.Lector["EstadoEnvioDescripcion"].ToString(),
                                FechaBaja = datos.Lector["EstadoEnvioFechaBaja"] is DBNull ? null : (DateTime?)datos.Lector["EstadoEnvioFechaBaja"]
                            }
                        } : null
                    };
                    lista.Add(venta);
                }

                return lista;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public List<VentaProducto> CargarProductosDeVenta(int ventaId)
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
    }
}