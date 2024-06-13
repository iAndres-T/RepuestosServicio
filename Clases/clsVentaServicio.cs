using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsVentaServicio
    {
        private DBRepuestosEntities dbRepuestos = new DBRepuestosEntities();
        public Venta_Servicio servicio { get; set; }
        public DetalleServicio detalleServicio { get; set; }

        public String GrabarVenta()
        {
            if (GrabarEncabezado())
            {
                return servicio.id.ToString() + "|" + servicio.fecha_venta;
            }
            else
            {
                return "Error al grabar el encabezado";
            }
        }

        private bool GrabarEncabezado()
        {
            int idGarantia = GrabarGarantia();
            if(idGarantia != 0)
            {
                servicio.id_garantia = idGarantia;
                servicio.id = GenerarNumeroFactura() + 1;
                servicio.fecha_venta = DateTime.Now;
                dbRepuestos.Venta_Servicio.Add(servicio);
                dbRepuestos.SaveChanges();
                return true;
            }
            return false;
        }

        private int GrabarGarantia()
        {
            int idGarantia = dbRepuestos.Garantia.Select(p => p.id).DefaultIfEmpty(0).Max();
            Garantia garantia = new Garantia();
            garantia.id = idGarantia + 1;
            garantia.id_cliente = servicio.id_cliente;
            garantia.duracion = "1 Mes";
            garantia.descripcion = "Garantía de 1 mes a partir del " + DateTime.Now.ToString("dd/MM/yyyy") + " por servicios prestados";
            dbRepuestos.Garantia.Add(garantia);
            dbRepuestos.SaveChanges();
            return garantia.id;
        }

        private int GenerarNumeroFactura()
        {
            int NroVenta = dbRepuestos.Venta_Servicio.Select(p => p.id).DefaultIfEmpty(0).Max();
            return NroVenta;
        }

        public string GrabarDetalle()
        {
            int idDetalle = dbRepuestos.DetalleServicio.Select(p => p.codigo).DefaultIfEmpty(0).Max();
            detalleServicio.codigo = idDetalle + 1;
            dbRepuestos.DetalleServicio.Add(detalleServicio);
            dbRepuestos.SaveChanges();
            return detalleServicio.id_venta.ToString();
        }

        public string GrabarTotal()
        {
            Venta_Servicio _venta = dbRepuestos.Venta_Servicio.FirstOrDefault(v => v.id == servicio.id);
            _venta.total = servicio.total;
            GrabarUltimaCompraCliente(_venta.id_cliente, _venta.fecha_venta);
            dbRepuestos.Venta_Servicio.AddOrUpdate(_venta);
            dbRepuestos.SaveChanges();
            return _venta.total.ToString();
        }

        private void GrabarUltimaCompraCliente(string id, DateTime? fecha)
        {
            Cliente cliente = dbRepuestos.Cliente.FirstOrDefault(c => c.documento == id);
            cliente.ultima_compra = fecha;
            dbRepuestos.Cliente.AddOrUpdate(cliente);
            dbRepuestos.SaveChanges();
        }

        public IQueryable LlenarTablaVenta(int idVenta)
        {
            return from VS in dbRepuestos.Set<Venta_Servicio>()
                   join DS in dbRepuestos.Set<DetalleServicio>()
                   on VS.id equals DS.id_venta
                   join S in dbRepuestos.Set<Servicio>()
                   on DS.id_servicio equals S.id
                   join E in dbRepuestos.Set<Empleado>()
                   on S.id_empleado equals E.documento
                   where VS.id == idVenta
                   select new
                   {
                       Eliminar = "<button type=\"button\" id=\"btnEliminar\" class=\"btn-block btn-sm btn-danger\" onclick=\"Eliminar(" + DS.codigo + "," + DS.valor + ")\">ELIMINAR</button>",
                       ID_Encargado = E.documento,
                       Encargado = E.nombre + " " + E.primer_apellido + " " + E.segundo_apellido,
                       ID_Servicio = S.id,
                       Servicio = S.descripcion,
                       Duración = DS.duracion,
                       Valor = DS.valor
                   };
        }

        public string Eliminar(int idDetalleVenta)
        {
            DetalleServicio detalle = dbRepuestos.DetalleServicio.FirstOrDefault(d => d.codigo == idDetalleVenta);
            dbRepuestos.DetalleServicio.Remove(detalle);
            dbRepuestos.SaveChanges();
            return "Se eliminó el detalle";
        }
    }
}