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
    [Authorize]
    public class MotoController : ApiController
    {
        // GET api/<controller>
        public List<object> Get()
        {
            clsMoto moto = new clsMoto();
            return moto.ConsultarMotos();
        }

        public Moto Get(string placa)
        {
            clsMoto _moto = new clsMoto();
            return _moto.Consultar(placa);
        }

        // POST api/<controller>
        public string Post([FromBody] Moto moto)
        {
            clsMoto _moto = new clsMoto();
            _moto.moto = moto;
            return _moto.Insertar();
        }

        // PUT api/<controller>/5
        public string Put([FromBody] Moto moto)
        {
            clsMoto _moto = new clsMoto();
            _moto.moto = moto;
            return _moto.Actualizar();
        }

        // DELETE api/<controller>/5
        public string Delete([FromBody] Moto moto)
        {
            clsMoto _moto = new clsMoto();
            _moto.moto = moto;
            return _moto.Eliminar();
        }

    }
}