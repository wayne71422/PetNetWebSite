using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetWebBackSite.Models.ViewModels
{
    public class LoginVm
    {
        public int MemberId { get; set; }
        [Display(Name = "管理者帳號")]
        [Required]
        public string Account { get; set; }

        [Display(Name = "密碼")]
        [Required]
        [DataType(DataType.Password)]

        public string Password { get; set; }
        
    }
}