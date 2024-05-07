using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsTipoRepuesto
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();

        public List<object> ConsultarTipoRepuestos()
        {
            return dBRepuestos.Tipo_Repuesto
                               .Select(tp => new { Codigo = tp.id, Nombre = tp.categoria })
                               .ToList<object>();
        }
    }
}