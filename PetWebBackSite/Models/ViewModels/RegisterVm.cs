using PetWebBackSite.Models.Dtos;
using PetWebBackSite.Models.EFModels;
using PetWebBackSite.Models.Infras;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetWebBackSite.Models.ViewModels
{
    public class RegisterVm
    {
        public int Id { get; set; }

        [Display(Name = "管理者帳號")]
        [Required]
        [StringLength(100)]
        
        public string Account { get; set; }

        /// <summary>
        /// 明碼
        /// </summary>
        [Display(Name = "密碼")]
        [Required]
        [MinLength(6, ErrorMessage = "密碼至少需要6個字符")]
        [StringLength(100)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "確認密碼")]
        [Required]
        [StringLength(100)]
        [Compare(nameof(Password))]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
        [Display(Name = "權限等級")]
        [Required]
        public bool PermissionLevel { get; set; }


        [Display(Name = "姓名")]
        [Required]
        [StringLength(100)]

        public string Name { get; set; }

        [Display(Name = "手機")]
        [StringLength(20)]

        public string PhoneNumber { get; set; }
        [Display(Name = "是否為醫生")]
        [StringLength(1)]
        [Required]

        public string DoctorBoolin { get; set; }
        [Display(Name = "最高學歷")]
        [Required]
        [StringLength(50)]
        public string Education { get; set; }
        [Display(Name = "專業")]
        [Required]
        [StringLength(50)]
        public string Expertise { get; set; }
        [Display(Name = "性別")]
        [StringLength(1)]
        [Required]
        public string Gender { get; set; }
            
        [Display(Name = "地址")]
        
        [StringLength(100)]
        public string Address { get; set; }
        [Display(Name = "上傳圖片")]
        public HttpPostedFileBase ProfilePicture { get; set; }  // 上傳圖片檔案

        [Display(Name = "出生年月日")]
        [Required]       
        public DateTime BirthDate { get; set; }
        public string MinDate { get; set; } = DateTime.Now.AddYears(-100).ToString("yyyy-MM-dd");
        public string MaxDate { get; set; } = DateTime.Now.AddYears(10).ToString("yyyy-MM-dd");
        [Display(Name = "Line代碼")]
        [StringLength(20)] // 確保長度與資料庫模型一致
        public string LineCode { get; set; }


        [Required(ErrorMessage = "您必須同意條款")]
        public bool AcceptTerms { get; set; }

    }
    public static class RegisterExt
    {
        public static ManagerProfile ToMember(this RegisterVm vm)
        {

            var hashPassword = HashUtility.ToSHA256(vm.Password);
            var confirmCode = Guid.NewGuid().ToString("N");

            return new ManagerProfile
            {
                Id = vm.Id,
                Password = hashPassword,
                Account = vm.Account,
                Name = vm.Name,
                PhoneNumber = vm.PhoneNumber,
                DoctorBoolin = vm.DoctorBoolin,
                Education =vm.Education,
                Expertise =vm.Expertise,
                Gender =vm.Gender,
                Address=vm.Address,
                BirthDate=vm.BirthDate,
                PermissionLevel =vm.PermissionLevel,
            };
        }
        public static RegisterDto ToDto(this RegisterVm vm)
        {
            return new RegisterDto
            {
                Id = vm.Id,
                Password = vm.Password,
                Account = vm.Account,
                Name = vm.Name,                
                PhoneNumber = vm.PhoneNumber,
                DoctorBoolin = vm.DoctorBoolin,
                Education = vm.Education,
                Expertise = vm.Expertise,
                Gender = vm.Gender,
                Address = vm.Address,
                BirthDate = vm.BirthDate,
                PermissionLevel = vm.PermissionLevel,
                LineCode = vm.LineCode // 添加 LineCode
            };
        }
    }
}