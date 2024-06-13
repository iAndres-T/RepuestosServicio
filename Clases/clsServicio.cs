using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsServicio
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();
        public Servicio servicio { get; set; }

        public string Insertar()
        {
            try
            {
                dBRepuestos.Servicio.Add(servicio);
                dBRepuestos.SaveChanges();
                return "Se grabó el servicio: " + servicio.descripcion;
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
                dBRepuestos.Servicio.AddOrUpdate(servicio);
                dBRepuestos.SaveChanges();
                return "Se actualizó el servicio: " + servicio.descripcion;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public Servicio Consultar(int id)
        {
            return dBRepuestos.Servicio.FirstOrDefault(c => c.id == id);
        }


        public IQueryable ConsultarTodos()
        {
            var servicios = from S in dBRepuestos.Set<Servicio>()
                            join E in dBRepuestos.Set<Empleado>() on S.id_empleado equals E.documento
                            select new
                            {
                                Id = S.id,
                                Descripción = S.descripcion,
                                Valor = S.valor,
                                Duración = S.duracion,
                                Encargado = E.nombre + " " + E.primer_apellido + " " + E.segundo_apellido
                            };

            return servicios;

        }

        public IQueryable LlenarCombo()
        {
            return from R in dBRepuestos.Set<Servicio>()                
                   select new
                   {
                       Codigo = R.id + "|" + R.valor + "|" + R.duracion.Replace(" ", ""),
                       Nombre = R.descripcion
                   };
        }

        public string Eliminar()
        {
            try
            {
                Servicio _servicio = Consultar(servicio.id);
                dBRepuestos.Servicio.Remove(_servicio);
                dBRepuestos.SaveChanges();
                return "Se eliminó el servicio: " + servicio.descripcion;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}