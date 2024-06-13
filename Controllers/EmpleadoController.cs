using RepuestosServicio.Clases;
using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace EmpleadosServicio.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/Empleado")]
    [Authorize]
    public class EmpleadoController : ApiController
    {
        public IQueryable Get()
        {
            clsEmpleado _empleado = new clsEmpleado();
            return _empleado.ConsultarEmpleados();
        }

        // GET api/<controller>/5
        public Empleado Get(string id)
        {
            clsEmpleado _empleado = new clsEmpleado();
            return _empleado.Consultar(id);
        }

        [HttpGet]
        [Route("ConsultarConCargo")]
        public IQueryable ConsultarConCargo(string id)
        {
            clsEmpleado _empleado = new clsEmpleado();
            return _empleado.ConsultarConCargo(id);
        }

        // POST api/<controller>
        public string Post([FromBody] Empleado empleado)
        {
            clsEmpleado _empleado = new clsEmpleado();
            _empleado.empleado = empleado;
            return _empleado.Insertar();
        }

        // PUT api/<controller>/5
        public string Put([FromBody] Empleado empleado)
        {
            clsEmpleado _empleado = new clsEmpleado();
            _empleado.empleado = empleado;
            return _empleado.Actualizar();
        }

        // DELETE api/<controller>/5
        public string Delete([FromBody] Empleado empleado)
        {
            clsEmpleado _empleado = new clsEmpleado();
            _empleado.empleado = empleado;
            return _empleado.Eliminar();
        }
    }
}