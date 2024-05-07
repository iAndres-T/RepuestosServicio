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
    public class ClienteController : ApiController
    {
        // GET api/<controller>
        public IQueryable Get()
        {
            clsCliente _cliente = new clsCliente();
            return _cliente.ConsultarTodos();
        }

        // GET api/<controller>/5
        public Cliente Get(string id)
        {
            clsCliente _cliente = new clsCliente();
            return _cliente.Consultar(id);
        }

        // POST api/<controller>
        public string Post([FromBody] Cliente cliente)
        {
            clsCliente _cliente = new clsCliente();
            _cliente.cliente = cliente;
            return _cliente.Insertar();
        }

        // PUT api/<controller>/5
        public string Put([FromBody] Cliente cliente)
        {
            clsCliente _cliente = new clsCliente();
            _cliente.cliente = cliente;
            return _cliente.Actualizar();
        }

        // DELETE api/<controller>/5
        public string Delete([FromBody] Cliente cliente)
        {
            clsCliente _cliente = new clsCliente();
            _cliente.cliente = cliente;
            return _cliente.Eliminar();
        }
    }
}