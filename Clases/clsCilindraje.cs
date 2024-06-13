using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsCilindraje
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();

        public List<object> ConsultarCilindrajes()
        {
            return dBRepuestos.Cilindraje
                               .Select(m => new { Codigo = m.id, Nombre = m.numero + "Cc" })
                               .ToList<object>();
        }
    }
}