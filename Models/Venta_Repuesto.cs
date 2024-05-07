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
    
    public partial class Venta_Repuesto
    {
        public int id { get; set; }
        public Nullable<decimal> valor_unitario { get; set; }
        public Nullable<int> cantidad { get; set; }
        public Nullable<decimal> valor_total { get; set; }
        public string id_cliente { get; set; }
        public Nullable<int> id_repuesto { get; set; }
        public string id_empleado { get; set; }
        public Nullable<System.DateTime> fecha_venta { get; set; }
        public string metodo_pago { get; set; }
    
        public virtual Cliente Cliente { get; set; }
        public virtual Empleado Empleado { get; set; }
        public virtual Repuesto Repuesto { get; set; }
    }
}