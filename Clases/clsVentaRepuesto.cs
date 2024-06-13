using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsVentaRepuesto
    {
        private DBRepuestosEntities dbRepuestos = new DBRepuestosEntities();
        public Venta_Repuesto venta { get; set; }
        public DetalleVenta detalleVenta { get; set; }

        public String GrabarVenta()
        {
            if (GrabarEncabezado())
            {
                return venta.id.ToString() + "|" + venta.fecha_venta;
            }
            else
            {
                return "Error al grabar el encabezado";
            }
        }

        private bool GrabarEncabezado()
        {
            venta.id = GenerarNumeroFactura() + 1;
            venta.fecha_venta = DateTime.Now;
            dbRepuestos.Venta_Repuesto.Add(venta);
            dbRepuestos.SaveChanges();
            return true;
        }

        private int GenerarNumeroFactura()
        {
            int NroVenta = dbRepuestos.Venta_Repuesto.Select(p => p.id).DefaultIfEmpty(0).Max();
            return NroVenta;
        }

        public string GrabarDetalle()
        {
            int idDetalle = dbRepuestos.DetalleVenta.Select(p => p.codigo).DefaultIfEmpty(0).Max();
            detalleVenta.codigo = idDetalle + 1;
            Repuesto repuesto = dbRepuestos.Repuesto.FirstOrDefault(r => r.id == detalleVenta.id_repuesto);
            if(repuesto.stock < detalleVenta.cantidad)
            {
                return "0";
            }
            repuesto.stock = repuesto.stock - detalleVenta.cantidad;
            dbRepuestos.Repuesto.AddOrUpdate(repuesto);
            dbRepuestos.SaveChanges();
            dbRepuestos.DetalleVenta.Add(detalleVenta);
            dbRepuestos.SaveChanges();
            return detalleVenta.id_venta.ToString();
        }

        public string GrabarTotal()
        {
            Venta_Repuesto _venta = dbRepuestos.Venta_Repuesto.FirstOrDefault(v => v.id == venta.id);
            _venta.total = venta.total;
            GrabarUltimaCompraCliente(_venta.id_cliente, _venta.fecha_venta);
            dbRepuestos.Venta_Repuesto.AddOrUpdate(_venta);
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
            return from VR in dbRepuestos.Set<Venta_Repuesto>()
                   join DV in dbRepuestos.Set<DetalleVenta>()
                   on VR.id equals DV.id_venta
                   join R in dbRepuestos.Set<Repuesto>()
                   on DV.id_repuesto equals R.id
                   join TR in dbRepuestos.Set<Tipo_Repuesto>()
                   on R.id_tipo_repuesto equals TR.id
                   where VR.id == idVenta
                   select new
                   {
                       Eliminar = "<button type=\"button\" id=\"btnEliminar\" class=\"btn-block btn-sm btn-danger\" onclick=\"Eliminar(" + DV.codigo + "," + DV.valor_unitario + ", " + DV.cantidad + ")\">ELIMINAR</button>",
                       ID_Tipo_Repuesto = TR.id,
                       Tipo_Repuesto = TR.categoria,
                       ID_Repuesto = R.id,
                       Repuesto = R.nombre,
                       Cantidad = DV.cantidad,
                       Valor_Unitario = DV.valor_unitario
                   };
        }

        public string Eliminar(int idDetalleVenta)
        {
            DetalleVenta detalle = dbRepuestos.DetalleVenta.FirstOrDefault(d => d.codigo == idDetalleVenta);
            Repuesto repuesto = dbRepuestos.Repuesto.FirstOrDefault(r => r.id == detalle.id_repuesto);
            repuesto.stock = repuesto.stock + detalle.cantidad;
            dbRepuestos.Repuesto.AddOrUpdate(repuesto);
            dbRepuestos.SaveChanges();
            dbRepuestos.DetalleVenta.Remove(detalle);
            dbRepuestos.SaveChanges();
            return "Se eliminó el detalle";
        }

    }
}