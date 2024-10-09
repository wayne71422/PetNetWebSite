using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetWebBackSite.Models.Dtos
{
    public class ManagerIncomeDetailsDto
    {
        public int Id { get; set; }
        public int MemberId { get; set; }
        public string MemberName { get; set; }
        public int BillDetailsId { get; set; }
        public decimal IncomeAmount { get; set; }
        public DateTime? SettlementDate { get; set; }
        public bool? IsEnd { get; set; }
       
    }
}