using RepuestosServicio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace RepuestosServicio
{
    public class clsCliente
    {
        private DBRepuestosEntities dBRepuestos = new DBRepuestosEntities();
        public Cliente cliente { get; set; }

        public string Insertar()
        {
            try
            {
                dBRepuestos.Cliente.Add(cliente);
                dBRepuestos.SaveChanges();
                return "Se grabó el cliente: " + cliente.nombre;
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
                dBRepuestos.Cliente.AddOrUpdate(cliente);
                dBRepuestos.SaveChanges();
                return "Se actualizó el cliente: " + cliente.nombre;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public Cliente Consultar(string documento)
        {
            return dBRepuestos.Cliente.FirstOrDefault(c => c.documento == documento);
        }


        public IQueryable ConsultarTodos()
        {
            var clientes = dBRepuestos.Set<Cliente>()
            .Select(C => new
            {
                C.documento,
                C.nombre,
                C.primer_apellido,
                C.segundo_apellido,
                C.fecha_nacimiento,
                C.direccion,
                C.telefono,
                C.correo,
                C.ultima_compra,
                C.tipo_persona
            })
            .ToList()
            .Select(C => new
            {
                Documento = C.documento,
                Nombre = C.nombre + " " + C.primer_apellido + " " + C.segundo_apellido,                
                Edad = CalcularEdad(C.fecha_nacimiento.Value),
                Dirección = C.direccion,
                Teléfono = C.telefono,
                Correo = C.correo,
                Última_Compra = C.ultima_compra.HasValue ? C.ultima_compra.Value.ToString("dd/MM/yyyy") : "Ninguna",
                Tipo_Persona = C.tipo_persona
            });

            return clientes.AsQueryable();

        }

        public string Eliminar()
        {
            try
            {
                Cliente _cliente = Consultar(cliente.documento);
                dBRepuestos.Cliente.Remove(_cliente);
                dBRepuestos.SaveChanges();
                return "Se eliminó el cliente de documento: " + cliente.documento;
            }
            catch (Exception ex)
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