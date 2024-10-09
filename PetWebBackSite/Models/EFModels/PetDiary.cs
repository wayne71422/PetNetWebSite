namespace PetWebBackSite.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PetDiary
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PetDiary()
        {
            Photos = new HashSet<Photo>();
        }

        public int Id { get; set; }

        public int PetId { get; set; }

        public DateTime CreateDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DataDate { get; set; }

        [StringLength(1)]
        public string Type { get; set; }

        public decimal? Weight { get; set; }

        [Required]
        [StringLength(50)]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }

        public virtual Member Member { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Photo> Photos { get; set; }
    }
}
