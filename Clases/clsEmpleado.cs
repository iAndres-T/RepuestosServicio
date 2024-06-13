using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace RepuestosServicio.Clases
{
    public class clsEmpleado
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();
        public Empleado empleado { get; set; }

        public string Insertar()
        {
            try
            {
                dBRepuestos.Empleado.Add(empleado);
                dBRepuestos.SaveChanges();
                return "Se grabó el empleado: " + empleado.nombre;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string Actualizar()
        {
            try
            {
                dBRepuestos.Empleado.AddOrUpdate(empleado);
                dBRepuestos.SaveChanges();
                return "Se actualizó el empleado: " + empleado.nombre;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public Empleado Consultar(string id)
        {
            return dBRepuestos.Empleado.FirstOrDefault(e => e.documento == id);
        }

        public IQueryable ConsultarConCargo(string id)
        {
            return from E in dBRepuestos.Set<Empleado>()
                   join C in dBRepuestos.Set<Cargo>()
                   on E.id_cargo equals C.id
                   where E.documento == id
                   select new
                   {
                       NombreEmpleado = E.nombre + " " + E.primer_apellido + " " + E.segundo_apellido,
                       Cargo = C.nombre
                   };
        }


        public IQueryable ConsultarEmpleados()
        {
            var consulta = (from E in dBRepuestos.Set<Empleado>()
                            join C in dBRepuestos.Set<Cargo>() on E.id_cargo equals C.id
                            select new
                            {
                                E.documento,
                                E.nombre,
                                E.primer_apellido,
                                E.segundo_apellido,
                                E.fecha_nacimiento,
                                E.direccion,
                                E.telefono,
                                E.correo,
                                E.fecha_inicio_contrato,
                                E.fecha_fin_contrato,
                                Cargo = C.nombre,
                                C.salario,
                                C.jornada
                            }).ToList()
                              .Select(E => new
                              {
                                Documento = E.documento,
                                Nombre = E.nombre + " " + E.primer_apellido + " " + E.segundo_apellido,
                                Edad = CalcularEdad(E.fecha_nacimiento.Value),
                                Dirección = E.direccion,
                                Teléfono = E.telefono,
                                Correo = E.correo,
                                Inicio_Contrato = E.fecha_inicio_contrato?.ToString("dd/MM/yyyy") ?? "N/A",
                                Fin_Contrato = E.fecha_fin_contrato?.ToString("dd/MM/yyyy") ?? "N/A",
                                E.Cargo,
                                Salario = E.salario,
                                Jornada = E.jornada
                              }).AsQueryable();

            return consulta;
        }

        public List<object> ConsultarEncargados()
        {
            return dBRepuestos.Empleado
                               .Select(m => new { Codigo = m.documento, Nombre = m.nombre + "-" + m.primer_apellido + "-" + m.segundo_apellido + "(" + m.documento + ")" })
                               .ToList<object>();
        }

        public string Eliminar()
        {
            try
            {
                Empleado _empleado = Consultar(empleado.documento);
                dBRepuestos.Empleado.Remove(_empleado);
                dBRepuestos.SaveChanges();
                return "Se eliminó el empleado: " + empleado.nombre;
            }
            catch (System.Exception ex)
            {
                return ex.Message;
            }
        }

        private int CalcularEdad(DateTime? fechaNacimiento)
        {
            if (fechaNacimiento.HasValue)
            {
                DateTime fechaActual = DateTime.Today;
                int edad = fechaActual.Year - fechaNacimiento.Value.Year;
                if (fechaNacimiento.Value > fechaActual.AddYears(-edad))
                {
                    edad--;
                }
                return edad;
            }
            return 0;
        }
    }
}