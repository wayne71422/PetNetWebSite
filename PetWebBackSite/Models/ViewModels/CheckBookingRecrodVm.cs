using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Collections;

namespace PetWebBackSite.Models.ViewModels
{
    public class CheckBookingRecrodVm
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public string MemberName { get; set; }

        public int PetId { get; set; }

        public string PetName { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime BookTime { get; set; }

        public int BookTimeId { get; set; }

        public int? IsStart { get; set; }

        public string IsStartStr
        {
            get
            {
                Dictionary<int, string> keyValuePairs = new Dictionary<int, string>()
                {
                    {1,"尚未開始諮詢" },
                    {0,"未通知且尚未開始" },
                    {2,"已開始諮詢" },
                    {3,"諮詢結束" },
                    {4,"諮詢逾時(已結束)" },
                    {5,"取消預約" }
                };
                return keyValuePairs[(int)IsStart];

            }
        }

        
    }
}