using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsGarantia
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();
        public Garantia garantia { get; set; }

        public IQueryable ConsultarTodos()
        {
            var garantias = (from G in dBRepuestos.Set<Garantia>()
                            join C in dBRepuestos.Set<Cliente>()
                            on G.id_cliente equals C.documento
                            join VS in dBRepuestos.Set<Venta_Servicio>()
                            on G.id equals VS.id_garantia
                            select new
                            {
                                ID = G.id,
                                Descripción = G.descripcion,
                                Número_Venta = VS.id,
                                Fecha_Venta = VS.fecha_venta,
                                Vigente = VS.fecha_venta,
                                Duración = G.duracion,
                                ID_Cliente = C.documento,
                                Cliente = C.nombre + " " + C.primer_apellido + " " + C.segundo_apellido
                            }).ToList()
                            .Select(E => new
                            {
                                E.ID,
                                E.Descripción,
                                E.Número_Venta,
                                Fecha_Venta = E.Fecha_Venta.Value.ToString("dd/MM/yyyy"),
                                Vigente = E.Vigente.Value.AddMonths(1) > DateTime.Now ? "Sí" : "No",
                                E.Duración,
                                E.ID_Cliente,
                                E.Cliente
                            }).AsQueryable();

            return garantias;

        }
    }
}