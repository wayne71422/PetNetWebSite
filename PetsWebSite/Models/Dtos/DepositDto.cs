using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Dtos
{
    public class DepositDto
    {
        public int MemberId { get; set; }
        public decimal DepositAmount { get; set; }
        public DateTime DepositDate { get; set; }
    }
}