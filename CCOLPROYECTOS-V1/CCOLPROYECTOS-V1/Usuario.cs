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
    
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            this.Proyecto = new HashSet<Proyecto>();
            this.Servicio = new HashSet<Servicio>();
        }
    
        public int id { get; set; }
        public int codigoUsuario { get; set; }
        public string correoUsuario { get; set; }
        public string contrasenaUsuario { get; set; }
        public int idCargo { get; set; }
        public int idAdmin { get; set; }
        public int idPersona { get; set; }
    
        public virtual Administrador Administrador { get; set; }
        public virtual Cargo Cargo { get; set; }
        public virtual Persona Persona { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Proyecto> Proyecto { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Servicio> Servicio { get; set; }
    }
}