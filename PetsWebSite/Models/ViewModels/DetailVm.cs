using PetsWebSite.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.ViewModels
{
    public class DetailVm
    {
        public List<DepositRecord> DepositRecords { get; set; }
        public List<BillDetail> ConsumptionRecords { get; set; }
        public int CurrentBalance { get; set; }
    }
}