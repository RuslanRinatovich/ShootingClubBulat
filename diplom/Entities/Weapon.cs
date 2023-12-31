//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShootingClub.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Weapon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Weapon()
        {
            this.Pricelists = new HashSet<Pricelist>();
        }
    
        public int WeaponID { get; set; }
        public string WeaponName { get; set; }
        public string WeaponDescription { get; set; }
        public int WeaponWeight { get; set; }
        public string WeaponCaliber { get; set; }
        public short WeaponClipSize { get; set; }
        public int WeaponTypeID { get; set; }
        public string WeaponImage { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Pricelist> Pricelists { get; set; }
        public virtual WeaponType WeaponType { get; set; }
    }
}
