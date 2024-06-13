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
    [RoutePrefix("api/Usuario")]
    [Authorize]
    public class UsuarioController : ApiController
    {
        [HttpPost]
        [Route("InsertarUsuario")]
        public string InsertarUsuario([FromBody] Usuario usuario)
        {
            clsUsuario _usuario = new clsUsuario();
            _usuario.usuario = usuario;
            return _usuario.Insertar();
        }

        [HttpGet]
        [Route("ListarUsuariosEmpleados")]
        public IQueryable ListarUsuariosEmpleados()
        {
            clsUsuario _usuario = new clsUsuario();
            return _usuario.ListarUsuariosEmpleados();
        }

        [HttpPut]
        [Route("ActualizarUsuario")]
        public string ActualizarUsuario([FromBody] Usuario usuario)
        {
            clsUsuario _usuario = new clsUsuario();
            _usuario.usuario = usuario;
            return _usuario.ModificarUsuario();
        }

    }
}