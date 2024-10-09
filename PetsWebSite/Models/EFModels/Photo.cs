namespace PetsWebSite.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Photo")]
    public partial class Photo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Photo()
        {
            PetsTags = new HashSet<PetsTag>();
        }

        public int Id { get; set; }

        public int? PetDiariesId { get; set; }

        [Required]
        [StringLength(70)]
        public string FileName { get; set; }

        [Required]
        [StringLength(255)]
        public string FilePath { get; set; }

        [Column(TypeName = "date")]
        public DateTime UploadDate { get; set; }

        public virtual PetDiary PetDiary { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PetsTag> PetsTags { get; set; }
    }
}
