namespace EmailBookingReminder.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PetProfile
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PetProfile()
        {
            BillDetails = new HashSet<BillDetail>();
            BookRecords = new HashSet<BookRecord>();
            PetsTags = new HashSet<PetsTag>();
        }

        public int Id { get; set; }

        public int MemberId { get; set; }

        [Required]
        [StringLength(30)]
        public string Name { get; set; }

        [StringLength(1)]
        public string Gender { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Birthday { get; set; }

        [StringLength(1)]
        public string Species { get; set; }

        [StringLength(50)]
        public string Breed { get; set; }

        public bool? Neutered { get; set; }

        [StringLength(255)]
        public string Photo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillDetail> BillDetails { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookRecord> BookRecords { get; set; }

        public virtual Member Member { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PetsTag> PetsTags { get; set; }
    }
}
