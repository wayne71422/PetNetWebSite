using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Dtos
{
    public class MemberDto
    {
        public int Id { get; set; }

        public string Email { get; set; }
        public string Name { get; set; }
        public string Mobile { get; set; }
        public bool? IsConfirmed { get; set; }
        public string ConfirmCode { get; set; }
        public string Password { get; set; } // 確保這裡有密碼欄位
        public string Address { get; set; }
    }
}