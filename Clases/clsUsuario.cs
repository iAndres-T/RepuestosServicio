using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace RepuestosServicio.Clases
{
    public class clsUsuario
    {
        private DBRepuestosEntities dbRepuestos = new DBRepuestosEntities();
        public Usuario usuario { get; set; }
        public string ModificarUsuario()
        {
            Usuario validar = dbRepuestos.Usuario.FirstOrDefault(u => u.user_name == usuario.user_name && u.id_empleado != usuario.id_empleado);

            if (validar != null)
            {
                return "El user name ya existe";
            }

            Usuario _usuario = dbRepuestos.Usuario.FirstOrDefault(u => u.id_empleado == usuario.id_empleado);
            _usuario.user_name = usuario.user_name;

            clsCypher cifrado = new clsCypher();
            cifrado.Password = usuario.clave;
            if (cifrado.CifrarClave())
            {
                _usuario.clave = cifrado.PasswordCifrado;
                _usuario.salt = cifrado.Salt;
                dbRepuestos.Usuario.AddOrUpdate(_usuario);
                dbRepuestos.SaveChanges();
            }
            else
            {
                return "No se pudeo cambiar la clave";
            }

            return "Se actualizó el usuario";
        }

        public string Insertar()
        {
            Usuario validar = dbRepuestos.Usuario.FirstOrDefault(u => u.user_name == usuario.user_name);

            if (validar != null)
            {
                return "El user name ya existe";
            }

            int idUsuario = dbRepuestos.Usuario.Select(p => p.id).DefaultIfEmpty(0).Max();
            usuario.id = idUsuario + 1;

            clsCypher cifrado = new clsCypher();
            cifrado.Password = usuario.clave;
            if (cifrado.CifrarClave())
            {
                usuario.clave = cifrado.PasswordCifrado;
                usuario.salt = cifrado.Salt;
                dbRepuestos.Usuario.Add(usuario);
                dbRepuestos.SaveChanges();

                return "Se generó el usuario: " + usuario.user_name;
            }
            else
            {
                return "No se pudo generar la clave";
            }
        }
        public IQueryable ListarUsuariosEmpleados()
        {
            return from U in dbRepuestos.Set<Usuario>()
                   join E in dbRepuestos.Set<Empleado>()
                   on U.id_empleado equals E.documento
                   join C in dbRepuestos.Set<Cargo>()
                   on E.id_cargo equals C.id
                   select new
                   {
                       Editar = "<button type=\"button\" id=\"btnConsultar\" class=\"btn-block btn-sm btn-danger\" onclick=\"Editar('" + E.documento +
                                "', '" + E.nombre + " " + E.primer_apellido + " " + E.segundo_apellido + "', '" + C.nombre + "', '" + U.user_name +
                                "', '" + U.id + "')\">EDIT</button>",
                       Documento = E.documento,
                       Empleado = E.nombre + " " + E.primer_apellido + " " + E.segundo_apellido,
                       Cargo = C.nombre,
                       Usuario = U.user_name
                   };
        }
    }
}