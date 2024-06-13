using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsLogin
    {
        private DBRepuestosEntities dbRepuestos = new DBRepuestosEntities();
        public LoginRequest login { get; set; }
        private LoginRespuesta logRpta;
        private bool ValidarUsuario()
        {
            try
            {
                clsCypher cifrar = new clsCypher();
                Usuario usuario = dbRepuestos.Usuario.FirstOrDefault(u => u.user_name == login.Username);
                if (usuario != null)
                {
                    byte[] arrBytesSalt = Convert.FromBase64String(usuario.salt);
                    string ClaveCifrada = cifrar.HashPassword(login.Password, arrBytesSalt);
                    login.Password = ClaveCifrada;
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                logRpta = new LoginRespuesta();
                logRpta.Error = ex.Message;
                return false;
            }
        }
        public IQueryable<LoginRespuesta> Consultar()
        {
            if (ValidarUsuario())
            {
                string token = TokenGenerator.GenerateTokenJwt(login.Username);
                return from U in dbRepuestos.Set<Usuario>()
                       where U.user_name == login.Username &&
                             U.clave == login.Password
                       select new LoginRespuesta
                       {
                           Usuario = U.user_name,
                           token = token,
                           Autenticado = true,
                           PaginaNavegar = "Empleado.html"
                       };
            }
            else
            {
                return Enumerable.Empty<LoginRespuesta>().AsQueryable();
            }
        }
    }
}