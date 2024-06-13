using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsMoto
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();
        public Moto moto { get; set; }

        public string Insertar()
        {
            try
            {
                dBRepuestos.Moto.Add(moto);
                dBRepuestos.SaveChanges();
                return "Se grabó la moto: " + moto.placa;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Actualizar()
        {
            try
            {
                dBRepuestos.Moto.AddOrUpdate(moto);
                dBRepuestos.SaveChanges();
                return "Se actualizó la moto: " + moto.placa;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public Moto Consultar(string placa)
        {
            return dBRepuestos.Moto.FirstOrDefault(m => m.placa == placa);
        }

        public List<object> ConsultarMotos()
        {
            var motos = (from moto in dBRepuestos.Moto
                         join marca in dBRepuestos.Marca on moto.id_marca equals marca.id
                         join cilindraje in dBRepuestos.Cilindraje on moto.id_cilindraje equals cilindraje.id
                         join cliente in dBRepuestos.Cliente on moto.id_cliente equals cliente.documento
                         select new
                         {
                             Placa = moto.placa,
                             Modelo = moto.modelo,
                             Linea = moto.linea,
                             Marca = marca.nombre,
                             Cilindraje = cilindraje.numero + "Cc",
                             Propietario = cliente.nombre + " " + cliente.primer_apellido,
                             Documento = cliente.documento
                         }).ToList<object>();

            return motos;
        }

        public string Eliminar()
        {
            try
            {
                Moto _moto = Consultar(moto.placa);
                dBRepuestos.Moto.Remove(_moto);
                dBRepuestos.SaveChanges();
                return "Se eliminó la moto: " + moto.placa;
            }
            catch (System.Exception ex)
            {
                return ex.Message;
            }
        }
    }
}