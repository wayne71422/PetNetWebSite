using PetsWebSite.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.ViewModels
{
    public class BookDateRecordVm
    {
        public int Id { get; set; }
        public string PetName { get; set; }
        public string DoctorName { get; set; }
        public string StartDate { get; set; }
        public string BookTime { get; set; }
        public int? IsStart { get; set; }

        public string IsStartStr
        {
            get
            {
                if (IsStart == 1)
                {
                    return "尚未開始諮詢";
                }
                else if (IsStart == 0)
                {
                    return "未通知且尚未開始(可取消)";
                }
                else if (IsStart == 2)
                {
                    return "已開始諮詢";
                }
                else if(IsStart == 3)
                {
                    return "諮詢結束";
                }
                else if (IsStart == 4)
                {
                    return "諮詢逾時(已結束)";
                }
				else if (IsStart == 5)
				{
					return "取消預約";
				}
				else
                {
                    return "未知錯誤，不可能沒有狀態!";
                }
            }
        }
    }
}