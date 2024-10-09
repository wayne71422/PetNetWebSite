using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Http.ModelBinding;

namespace PetWebBackSite.Models.ViewModels
{
    public class ManagerIncomeVm
    {
        public int TotalIncome { get; set; }
        public int? SelectYear { get; set; }

        [Range(1, 12, ErrorMessage = "請輸入 1 到 12 月之間的月份")]
        public int? SelectMonth { get; set; }

        public DateTime? SelectRange
        {
            get
            {
                if (SelectYear != null && SelectMonth != null)
                {
                    return new DateTime(SelectYear.Value, SelectMonth.Value, 1);
                }
                else if (SelectMonth > 12 || SelectMonth <= 0)
                {
                    return new DateTime(SelectYear.Value, 0, 1);
                }
                else return null;
            }
        }

        
        public int? SelecteTimeSpan { get; set; }

        public IEnumerable<ManagerIncomeDetailsVm> ManagerIncomeDetails { get; set; }
    }
}