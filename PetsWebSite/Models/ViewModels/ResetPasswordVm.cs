using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.ViewModels
{
    public class ResetPasswordVm
    {
        public int MemberId { get; set; } // 用來傳遞會員 ID
        public string ConfirmCode { get; set; } // 用來傳遞確認碼
        [Display(Name = "新密碼")]
        [Required(ErrorMessage = "{0}必填")]
        [StringLength(50)]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }

        [Display(Name = "確認密碼")]
        [Required(ErrorMessage = "{0}必填")]
        [StringLength(50)]
        [Compare(nameof(NewPassword))]
        [DataType(DataType.Password)]

        public string ConfirmPassword { get; set; }
    }
}