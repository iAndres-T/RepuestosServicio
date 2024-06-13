using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsRepuesto
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();
        public Repuesto repuesto { get; set; }

        public string Insertar()
        {
            try
            {
                dBRepuestos.Repuesto.Add(repuesto);
                dBRepuestos.SaveChanges();
                return "Se grabó el repuesto: " + repuesto.nombre;
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
                dBRepuestos.Repuesto.AddOrUpdate(repuesto);
                dBRepuestos.SaveChanges();
                return "Se actualizó el repuesto: " + repuesto.nombre;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public Repuesto Consultar(int id)
        {
            return dBRepuestos.Repuesto.FirstOrDefault(r => r.id == id);
        }


        public IQueryable ConsultarRepuestos()
        {
            var consulta = (from R in dBRepuestos.Set<Repuesto>()
                            join P in dBRepuestos.Set<Proveedor>() on R.id_proveedor equals P.id
                            join Ma in dBRepuestos.Set<Marca>() on R.id_marca equals Ma.id
                            join TR in dBRepuestos.Set<Tipo_Repuesto>() on R.id_tipo_repuesto equals TR.id
                            select new
                            {
                                R.nombre,
                                R.descripcion,
                                R.numero_referencia,
                                R.numero_serie,
                                R.precio,
                                R.stock,
                                R.fecha_actualizacion,
                                TR.categoria,
                                Marca = Ma.nombre,
                                Proveedor = P.nombre
                            }).ToList()
                              .Select(R => new
                              {
                                  Nombre = R.nombre,
                                  Descripción = R.descripcion,
                                  Numero_Referencia = R.numero_referencia,
                                  Numero_Serie = R.numero_serie,
                                  Precio = R.precio,
                                  Stock = R.stock,
                                  Renovado = R.fecha_actualizacion?.ToString("dd/MM/yyyy") ?? "N/A",
                                  Categoría = R.categoria,
                                  R.Marca,
                                  R.Proveedor
                              }).AsQueryable();

            return consulta;
        }

        public IQueryable LlenarCombo(int idTipoRepuesto)
        {
            return from R in dBRepuestos.Set<Repuesto>()
                   where R.id_tipo_repuesto == idTipoRepuesto
                   select new
                   {
                       Codigo = R.id + "|" + R.precio,
                       Nombre = R.nombre
                   };
        }

        public string Eliminar()
        {
            try
            {
                Repuesto _repuesto = Consultar(repuesto.id);
                dBRepuestos.Repuesto.Remove(_repuesto);
                dBRepuestos.SaveChanges();
                return "Se eliminó el repuesto: " + repuesto.nombre;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}