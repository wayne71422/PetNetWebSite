namespace EmailBookingReminder.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BillDetail
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BillDetail()
        {
            ManagerIncomeDetails = new HashSet<ManagerIncomeDetail>();
        }

        public int Id { get; set; }

        public int MemberId { get; set; }

        public int PetId { get; set; }

        [Required]
        [StringLength(100)]
        public string PetName { get; set; }

        public int DoctorId { get; set; }

        [Required]
        [StringLength(100)]
        public string DoctorName { get; set; }

        public decimal Amount { get; set; }

        public DateTime? EndDate { get; set; }

        public int BookRecordId { get; set; }

        public virtual Member Member { get; set; }

        public virtual PetProfile PetProfile { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ManagerIncomeDetail> ManagerIncomeDetails { get; set; }
    }
}
