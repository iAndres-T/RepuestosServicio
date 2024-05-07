using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsCargo
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();

        public List<object> ConsultarCargos()
        {
            return dBRepuestos.Cargo
                               .Select(c => new { Codigo = c.id, Nombre = c.nombre })
                               .ToList<object>();
        }
    }
}