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
    [RoutePrefix("api/VentaServicio")]
    [Authorize]
    public class VentaServicioController : ApiController
    {
        [HttpPost]
        [Route("GrabarVenta")]
        public string GrabarVenta(Venta_Servicio servicio)
        {
            clsVentaServicio ventaServicio = new clsVentaServicio();
            ventaServicio.servicio = servicio;
            return ventaServicio.GrabarVenta();
        }

        [HttpPost]
        [Route("GrabarDetalle")]
        public string GrabarDetalle(DetalleServicio detalleServicio)
        {
            clsVentaServicio ventaServicio = new clsVentaServicio();
            ventaServicio.detalleServicio = detalleServicio;
            return ventaServicio.GrabarDetalle();
        }

        [HttpPut]
        [Route("GrabarTotal")]
        public string GrabarTotal(Venta_Servicio servicio)
        {
            clsVentaServicio ventaServicio = new clsVentaServicio();
            ventaServicio.servicio = servicio;
            return ventaServicio.GrabarTotal();
        }

        [HttpGet]
        [Route("LlenarTablaVenta")]
        public IQueryable LlenarTablaVenta(int idVenta)
        {
            clsVentaServicio ventaServicio = new clsVentaServicio();
            return ventaServicio.LlenarTablaVenta(idVenta);
        }

        [HttpDelete]
        [Route("EliminarDetalle")]
        public string EliminarDetalle(int idDetalle)
        {
            clsVentaServicio ventaServicio = new clsVentaServicio();
            return ventaServicio.Eliminar(idDetalle);
        }
    }
}