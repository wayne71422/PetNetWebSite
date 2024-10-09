using PetWebBackSite.Models.Dtos;
using System;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace PetWebBackSite.Models.ViewModels
{
    public class EditUserVm
    {
        public int Id { get; set; }

        [Display(Name = "管理者帳號")]
        [Required]
        [StringLength(100)]
        public string Account { get; set; }

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

        [Display(Name = "權限等級")]
        [Required]
        public bool PermissionLevel { get; set; }
    }

    public static class EditUserExt
    {
        public static ManagerDto ToDto(this EditUserVm vm)
        {
            return new ManagerDto
            {
                Id = vm.Id,
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
				
				// Handle ProfilePicture in the controller during image upload
			};
        }

        public static EditUserVm ToVm(this ManagerDto dto)
        {
            return new EditUserVm
            {
                Id = dto.Id,
                Account = dto.Account,
                Name = dto.Name,
                PhoneNumber = dto.PhoneNumber,
                DoctorBoolin = dto.DoctorBoolin,
                Education = dto.Education,
                Expertise = dto.Expertise,
                Gender = dto.Gender,
                Address = dto.Address,
                BirthDate = (DateTime)dto.BirthDate,
                PermissionLevel = dto.PermissionLevel,
                // Handle ProfilePicture in the controller during image upload
            };
        }
    }
}
