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
    using Newtonsoft.Json;

    public partial class Garantia
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Garantia()
        {
            this.Venta_Servicio = new HashSet<Venta_Servicio>();
        }
    
        public int id { get; set; }
        public string descripcion { get; set; }
        public string duracion { get; set; }
        public string id_cliente { get; set; }

        [JsonIgnore]
        public virtual Cliente Cliente { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        [JsonIgnore]
        public virtual ICollection<Venta_Servicio> Venta_Servicio { get; set; }
    }
}
