using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.SessionState;
using static System.Collections.Specialized.BitVector32;

namespace dominio
{
    public static class Helper
    {
        private static readonly string Key = "12345678901234567890123456789012"; //en entorno real me bajo un paquete de nuget, es el ejemplo mas sencillo que encontre en google
        private static readonly string IV = "1234567890123456";
        public static bool VerificarUsuario(HttpSessionState Session, HttpResponse Response, params Permisos[] permisosRequeridos)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("/Usuarios/Login.aspx", false);
                return false;
            }
            Usuario usuario = (Usuario)Session["usuario"];

            //Verificar que tenga al menos 1 permiso de los que se necesita para ingresar a la interfaz
            bool tienePermiso = false;
            foreach (var permiso in permisosRequeridos)
            {
                if (usuario.TienePermiso(permiso))
                {
                    tienePermiso = true;
                }
            }
            if (!tienePermiso)
            {
                Session.Add("Error", "Acceso denegado, no tienes permisos para ingresar a esta seccion");
                Response.Redirect("/Error.aspx", false);
                return false;
            }
            return true;
        }

        
        public static string HashPassword(string password)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha.ComputeHash(bytes);
                StringBuilder sb = new StringBuilder();
                foreach (var b in hash)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
        }

        //lei la docu y no entendi un pomo, es mas facil bajar un paquete pero los que baje crashearon no se por que
        //se implemento y listo, igual la semilla deberia ser de variable de entorno pero bue, es para mostrar
        public static string Encriptar(string texto)
        {
            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(Key);
                aes.IV = Encoding.UTF8.GetBytes(IV);
                ICryptoTransform encryptor = aes.CreateEncryptor();

                byte[] inputBytes = Encoding.UTF8.GetBytes(texto);
                byte[] result = encryptor.TransformFinalBlock(inputBytes, 0, inputBytes.Length);

                return Convert.ToBase64String(result);
            }
        }

        public static string Desencriptar(string textoEncriptado)
        {
            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(Key);
                aes.IV = Encoding.UTF8.GetBytes(IV);
                ICryptoTransform decryptor = aes.CreateDecryptor();

                byte[] inputBytes = Convert.FromBase64String(textoEncriptado);
                byte[] result = decryptor.TransformFinalBlock(inputBytes, 0, inputBytes.Length);

                return Encoding.UTF8.GetString(result);
            }
        }
    }
}