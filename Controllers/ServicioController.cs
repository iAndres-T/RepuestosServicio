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
    [RoutePrefix("api/Servicio")]
    [Authorize]
    public class ServicioController : ApiController
    {
        // GET api/<controller>
        public IQueryable Get()
        {
            clsServicio _servicio = new clsServicio();
            return _servicio.ConsultarTodos();
        }

        // GET api/<controller>/5
        public Servicio Get(int id)
        {
            clsServicio _servicio = new clsServicio();
            return _servicio.Consultar(id);
        }

        [HttpGet]
        [Route("LlenarCombo")]
        public IQueryable LlenarCombo()
        {
            clsServicio _servicio = new clsServicio();
            return _servicio.LlenarCombo();
        }

        // POST api/<controller>
        public string Post([FromBody] Servicio servicio)
        {
            clsServicio _servicio = new clsServicio();
            _servicio.servicio = servicio;
            return _servicio.Insertar();
        }

        // PUT api/<controller>/5
        public string Put([FromBody] Servicio servicio)
        {
            clsServicio _servicio = new clsServicio();
            _servicio.servicio = servicio;
            return _servicio.Actualizar();
        }

        // DELETE api/<controller>/5
        public string Delete([FromBody] Servicio servicio)
        {
            clsServicio _servicio = new clsServicio();
            _servicio.servicio = servicio;
            return _servicio.Eliminar();
        }
    }
}