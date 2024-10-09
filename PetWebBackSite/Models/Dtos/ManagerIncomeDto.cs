using PetWebBackSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetWebBackSite.Models.Dtos
{
    public class ManagerIncomeDto
    {
        public int TotalIncome { get; set; }
        public int? SelectYear { get; set; }
        public int? SelectMonth { get; set; }
        public DateTime? SelectRange { get; set; }
        public int? SelecteTimeSpan { get; set; }
        public IEnumerable<ManagerIncomeDetailsDto> ManagerIncomeDetails { get; set; }
    }
}