using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsProveedor
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();

        public List<object> ConsultarProveedores()
        {
            return dBRepuestos.Proveedor
                               .Select(p => new { Codigo = p.id, Nombre = p.nombre })
                               .ToList<object>();
        }
    }
}