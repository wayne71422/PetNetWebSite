using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetWebBackSite.Models.Dtos
{
    public class ManagerDto
    {
        public int Id { get; set; } // 管理員ID

        public bool PermissionLevel { get; set; } // 權限等級，True 代表管理員，False 代表普通用戶

        public string FullName { get; set; } // 全名

        public string Account { get; set; } // 登入帳號

        public string Password { get; set; } // 登入密碼

        public string DoctorBoolin { get; set; } // 是否為醫生，True 為醫生，False 為非醫生

        public string ProfilePicture { get; set; } // 個人頭像圖片的路徑或網址

        public string Education { get; set; } // 教育背景

        public string Expertise { get; set; } // 專業領域
        public DateTime? BirthDate { get; set; }

        public string Name { get; set; } // 顯示名稱

        public string Gender { get; set; } // 性別，M 或 F

        public string PhoneNumber { get; set; } // 電話號碼

        public string Address { get; set; } // 地址
        
    }

}