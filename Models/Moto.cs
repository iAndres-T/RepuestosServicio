//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RepuestosServicio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Moto
    {
        public string linea { get; set; }
        public Nullable<int> modelo { get; set; }
        public Nullable<int> id_marca { get; set; }
        public Nullable<int> id_cilindraje { get; set; }
        public string placa { get; set; }
        public string id_cliente { get; set; }
    
        public virtual Cilindraje Cilindraje { get; set; }
        public virtual Cliente Cliente { get; set; }
        public virtual Marca Marca { get; set; }
    }
}