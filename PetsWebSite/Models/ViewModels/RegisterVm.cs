using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Infra;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.ViewModels
{
    public class RegisterVm
    {
        public int Id { get; set; }

        [Display(Name = "信箱")]
        [Required]
        [StringLength(256)]
        [EmailAddress]
        public string Email { get; set; }

        /// <summary>
        /// 明碼
        /// </summary>
        [Display(Name = "密碼")]
        [Required]
        [MinLength(6, ErrorMessage = "密碼至少需要6個字符")]
        [StringLength(50)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "確認密碼")]
        [Required]
        [StringLength(50)]
        [Compare(nameof(Password))]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }



        [Display(Name = "姓名")]
        [Required]
        [StringLength(30)]

        public string Name { get; set; }

        [Display(Name = "手機")]
        [StringLength(10)]

        public string Mobile { get; set; }
        [Required(ErrorMessage = "您必須同意條款")]
        public bool AcceptTerms { get; set; }

    }
    public static class RegisterExt
    {
        public static Member ToMember(this RegisterVm vm)
        {

            var hashPassword = HashUtility.ToSHA256(vm.Password);
            var confirmCode = Guid.NewGuid().ToString("N");

            return new Member
            {
                Id = vm.Id,
                Password = hashPassword,
                Email = vm.Email,
                Name = vm.Name,
                Mobile = vm.Mobile,
                IsConfirmed = false,
                ConfirmCode = confirmCode,
            };
        }
        public static RegisterDto ToDto(this RegisterVm vm)
        {
            return new RegisterDto
            {
                Id = vm.Id,
                Password = vm.Password,
                Email = vm.Email,
                Name = vm.Name,
                Mobile = vm.Mobile,

            };
        }
    }
}
