﻿using RepuestosServicio.Clases;
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
    public class EncargadoController : ApiController
    {
        public List<object> Get()
        {
            clsEmpleado encargado = new clsEmpleado();
            return encargado.ConsultarEncargados();
        }
    }
}