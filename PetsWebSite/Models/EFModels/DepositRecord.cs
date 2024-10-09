namespace PetsWebSite.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DepositRecord
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public DateTime? DepositDate { get; set; }

        public decimal DepositAmount { get; set; }

        public virtual Member Member { get; set; }
    }
}
