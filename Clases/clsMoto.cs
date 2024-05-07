using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsMoto
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();

        public List<object> ConsultarMotos()
        {
            var motos = (from moto in dBRepuestos.Moto
                         join marca in dBRepuestos.Marca on moto.id_marca equals marca.id
                         join cilindraje in dBRepuestos.Cilindraje on moto.id_cilindraje equals cilindraje.id
                         select new
                         {
                             Codigo = moto.placa,
                             Nombre = marca.nombre + "(" + cilindraje.numero +"Cc)"
                         }).ToList<object>();

            return motos;
        }
    }
}