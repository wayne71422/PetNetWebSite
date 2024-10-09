using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.ViewModels
{
    public class LoginVm
    {
        [Display(Name = "電子信箱")]
        [Required]
        public string Email { get; set; }

        [Display(Name = "密碼")]
        [Required]
        [DataType(DataType.Password)]

        public string Password { get; set; }
        public bool RememberMe { get; set; }
    }
}