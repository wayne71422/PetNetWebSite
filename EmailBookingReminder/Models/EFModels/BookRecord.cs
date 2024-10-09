namespace EmailBookingReminder.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BookRecord
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        [Column(TypeName = "date")]
        public DateTime StartDate { get; set; }

        public DateTime BookTime { get; set; }

        public int BookTimeId { get; set; }

        public int DoctorId { get; set; }

        [Required]
        [StringLength(100)]
        public string DoctorName { get; set; }

        public int? IsStart { get; set; }

        public int PetId { get; set; }

        public virtual BookTime BookTime1 { get; set; }

        public virtual Member Member { get; set; }

        public virtual PetProfile PetProfile { get; set; }
    }
}
