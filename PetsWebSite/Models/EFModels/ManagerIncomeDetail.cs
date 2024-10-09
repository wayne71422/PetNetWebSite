namespace PetsWebSite.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ManagerIncomeDetail
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public int MemberId { get; set; }

        [Required]
        [StringLength(100)]
        public string MemberName { get; set; }

        public int BillDetailsId { get; set; }

        public decimal IncomeAmount { get; set; }

        public DateTime? SettlementDate { get; set; }

        public bool? IsEnd { get; set; }

        public virtual BillDetail BillDetail { get; set; }

        public virtual Member Member { get; set; }
    }
}
