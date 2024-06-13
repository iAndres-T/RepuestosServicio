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
    [RoutePrefix("api/Repuesto")]
    [Authorize]
    public class RepuestoController : ApiController
    {
        // GET api/<controller>
        public IQueryable Get()
        {
            clsRepuesto _repuesto = new clsRepuesto();
            return _repuesto.ConsultarRepuestos();
        }

        // GET api/<controller>/5
        public Repuesto Get(int id)
        {
            clsRepuesto _repuesto = new clsRepuesto();
            return _repuesto.Consultar(id);
        }

        [HttpGet]
        [Route("LlenarComboXTipoRepuesto")]
        public IQueryable LlenarComboXTipoProducto(int idTipoRepuesto)
        {
            clsRepuesto _repuesto = new clsRepuesto();
            return _repuesto.LlenarCombo(idTipoRepuesto);
        }

        // POST api/<controller>
        public string Post([FromBody] Repuesto repuesto)
        {
            clsRepuesto _repuesto = new clsRepuesto();
            _repuesto.repuesto = repuesto;
            return _repuesto.Insertar();
        }

        // PUT api/<controller>/5
        public string Put([FromBody] Repuesto repuesto)
        {
            clsRepuesto _repuesto = new clsRepuesto();
            _repuesto.repuesto = repuesto;
            return _repuesto.Actualizar();
        }

        // DELETE api/<controller>/5
        public string Delete([FromBody] Repuesto repuesto)
        {
            clsRepuesto _repuesto = new clsRepuesto();
            _repuesto.repuesto = repuesto;
            return _repuesto.Eliminar();
        }
    }
}