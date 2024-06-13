using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Models
{
    public class LoginRequest
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
    public class LoginRespuesta
    {
        public string Usuario { get; set; }
        public string token { get; set; }
        public string PaginaNavegar { get; set; }
        public bool Autenticado { get; set; }
        public string Error { get; set; }
    }
}