//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CCOLPROYECTOS_V1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Proyecto
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Proyecto()
        {
            this.SerPro = new HashSet<SerPro>();
        }
    
        public int id { get; set; }
        public string codigoProyecto { get; set; }
        public string nombreProyecto { get; set; }
        public System.DateTime fechaProyecto { get; set; }
        public int valorProyecto { get; set; }
        public string lineaProyecto { get; set; }
        public int idUsuario { get; set; }
        public Nullable<int> idCliente { get; set; }
        public Nullable<int> idEstadoSP { get; set; }
        public Nullable<int> idCiudad { get; set; }
        public Nullable<int> idRecursoT { get; set; }
        public Nullable<int> idLineaT { get; set; }
    
        public virtual Usuario Usuario { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SerPro> SerPro { get; set; }
        public virtual Ciudad Ciudad { get; set; }
        public virtual Cliente Cliente { get; set; }
        public virtual EstadoSerPro EstadoSerPro { get; set; }
        public virtual LineaTrabajo LineaTrabajo { get; set; }
        public virtual RecursoTecnico RecursoTecnico { get; set; }
    }
}