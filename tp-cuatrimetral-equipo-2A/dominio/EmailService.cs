using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Services.Description;

namespace dominio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;
        private string host;
        private int port;
        private string username;
        private string password;
        private string fromEmail;

        public EmailService()
        {
            host = ConfigurationManager.AppSettings["SMTP_Host"];
            port = int.Parse(ConfigurationManager.AppSettings["SMTP_Port"]);
            username = ConfigurationManager.AppSettings["SMTP_Username"];
            password = ConfigurationManager.AppSettings["SMTP_Password"];
            fromEmail = ConfigurationManager.AppSettings["SMTP_FromEmail"];

            server = new SmtpClient();
            server.Credentials = new NetworkCredential(username, password);
            server.EnableSsl = true;
            server.Port = port;
            server.Host = host;
        }

        public void SetMail(string correoDestino, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress(fromEmail);
            email.To.Add(correoDestino);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = cuerpo;
        }
        public void SendMail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void EnviarMailRecuperarContrasena(Usuario usuario)
        {
            string correoDestino = usuario.Email;
            string token = usuario.ResetToken;
            string link = "https://localhost:44324/Usuarios/ResetearContrasena.aspx?token=" + token + "&email=" + usuario.Email;
            string asunto = "Recuperación de contraseña - Acción requerida";
            string cuerpo = $@"
                <p>Hola,</p>
                <p>Hemos recibido una solicitud para restablecer la contraseña de tu cuenta.</p>
                <p>Para continuar, haz clic en el siguiente enlace:</p>
                <p><a href='{link}' style='background-color:#007bff;color:#ffffff;padding:10px 20px;text-decoration:none;border-radius:5px;'>Restablecer contraseña</a></p>
                <p><small>Este enlace expirará en 1 hora por motivos de seguridad.</small></p>
                <p>Si no solicitaste este cambio, puedes ignorar este correo.</p>
                <br />
                <p>Saludos,<br />El equipo de soporte</p>";
            SetMail(correoDestino, asunto, cuerpo);
            SendMail();
        }

    }
}