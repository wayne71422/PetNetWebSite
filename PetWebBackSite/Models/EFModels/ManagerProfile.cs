namespace PetWebBackSite.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ManagerProfile
    {
        public int Id { get; set; }

        public bool PermissionLevel { get; set; }

        [StringLength(50)]
        public string FullName { get; set; }

        [Required]
        [StringLength(100)]
        public string Account { get; set; }

        [Required]
        [StringLength(100)]
        public string Password { get; set; }

        [Required]
        [StringLength(1)]
        public string DoctorBoolin { get; set; }

        [StringLength(255)]
        public string ProfilePicture { get; set; }

        [Required]
        [StringLength(50)]
        public string Education { get; set; }

        [Required]
        [StringLength(50)]
        public string Expertise { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        [StringLength(1)]
        public string Gender { get; set; }

        [Required]
        [StringLength(20)]
        public string PhoneNumber { get; set; }

        [StringLength(100)]
        public string Address { get; set; }

        [Column(TypeName = "date")]
        public DateTime? BirthDate { get; set; }

        [StringLength(20)]
        public string LineCode { get; set; }
    }
}
