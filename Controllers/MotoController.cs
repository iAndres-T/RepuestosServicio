using RepuestosServicio.Clases;
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
    public class MotoController : ApiController
    {
        // GET api/<controller>
        public List<object> Get()
        {
            clsMoto moto = new clsMoto();
            return moto.ConsultarMotos();
        }

    }
}