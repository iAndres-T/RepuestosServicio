using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsMarca
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();

        public List<object> ConsultarMarcas()
        {
            return dBRepuestos.Marca
                               .Select(m => new { Codigo = m.id, Nombre = m.nombre })
                               .ToList<object>();
        }
    }
}