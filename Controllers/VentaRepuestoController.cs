using RepuestosServicio.Clases;
using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace RepuestosServicio.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/VentaRepuesto")]
    [Authorize]
    public class VentaRepuestoController : ApiController
    {
        [HttpPost]
        [Route("GrabarVenta")]
        public string GrabarVenta(Venta_Repuesto venta)
        {
            clsVentaRepuesto ventaRepuesto = new clsVentaRepuesto();
            ventaRepuesto.venta = venta;
            return ventaRepuesto.GrabarVenta();
        }

        [HttpPost]
        [Route("GrabarDetalle")]
        public string GrabarDetalle(DetalleVenta detalleVenta)
        {
            clsVentaRepuesto ventaRepuesto = new clsVentaRepuesto();
            ventaRepuesto.detalleVenta = detalleVenta;
            return ventaRepuesto.GrabarDetalle();
        }

        [HttpPut]
        [Route("GrabarTotal")]
        public string GrabarTotal(Venta_Repuesto venta)
        {
            clsVentaRepuesto ventaRepuesto = new clsVentaRepuesto();
            ventaRepuesto.venta = venta;
            return ventaRepuesto.GrabarTotal();
        }

        [HttpGet]
        [Route("LlenarTablaVenta")]
        public IQueryable LlenarTablaVenta(int idVenta)
        {
            clsVentaRepuesto ventaRepuesto = new clsVentaRepuesto();
            return ventaRepuesto.LlenarTablaVenta(idVenta);
        }

        [HttpDelete]
        [Route("EliminarDetalle")]
        public string EliminarDetalle(int idDetalle)
        {
            clsVentaRepuesto ventaRepuesto = new clsVentaRepuesto();
            return ventaRepuesto.Eliminar(idDetalle);
        }
    }
}