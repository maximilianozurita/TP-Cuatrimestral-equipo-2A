using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace negocio
{
    public class PagoNegocio
    {
        public static Pago ObtenerPagos()
        {
            AccesoDatos datos = new AccesoDatos();
            Pago pago = new Pago();
            try
            {
                datos.SetearConsulta("select CBU,Alias, Token from MediosDePago where id=1");
                datos.EjecutarLectura();
                if (datos.Lector.Read())
                {
                    pago.CBU = Helper.Desencriptar(datos.Lector["CBU"].ToString());
                    pago.Alias = Helper.Desencriptar(datos.Lector["Alias"].ToString());
                    pago.Token = Helper.Desencriptar(datos.Lector["Token"].ToString());
                }
                return pago;
            }
            catch (Exception ex)
            {
                pago.Token = "APP_USR-5339864898656958-062915-7b25249619821e8e7a437d9b443377f3-1382826563";
                return pago;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public static void SetearPago(Pago pago)
        {
            pago.CBU = Helper.Encriptar(pago.CBU);
            pago.Alias = Helper.Encriptar(pago.Alias);
            pago.Token = Helper.Encriptar(pago.Token);

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("update MediosDePago set CBU=@CBU,Alias=@Alias,Token=@Token where id = 1; ");
                datos.SetearParametros("@CBU",pago.CBU);
                datos.SetearParametros("@Alias", pago.Alias);
                datos.SetearParametros("@Token", pago.Token);
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

    }
}