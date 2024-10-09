using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using System.Web.Mvc;

namespace PetsWebSite.Models.ViewModels
{
    public class DiaryVm
    {
        public int PetId { get; set; }

        public string Name { get; set; }

        [Display(Name = "記錄日")]
        [Required(ErrorMessage = "{0}必填")]
        public DateTime DataDate { get; set; }

        public string Type { get; set; }

        [Display(Name = "體重")]
        public decimal? Weight { get; set; }

        [Display(Name = "記錄類別")]
        [Required(ErrorMessage = "{0}必填")]
        public string Title { get; set; }
        public IEnumerable<SelectListItem> TitleItems { get; set; }

        [Display(Name = "內容")]
        [Required(ErrorMessage = "{0}必填")]
        public string Content { get; set; }

        public IEnumerable<Photo> Photos { get; set; }

        [Display(Name = "上傳照片")]
        public IEnumerable<HttpPostedFileBase> UploadPhotos { get; set; }

        public Dictionary<int, Dictionary<int, List<DiaryDto>>> Diaries { get; set; }
    }
}