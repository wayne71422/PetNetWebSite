using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PetsWebSite.Models.ViewModels
{
    public class PetCreateVm
    {
        [Display(Name = "寵物名")]
        [Required(ErrorMessage ="{0}必填")]
        public string Name { get; set; }

        [Display(Name = "性別")]
        [Required(ErrorMessage = "{0}必填")]
        public string GenderId { get; set; }
        public IEnumerable<SelectListItem> GenderItems { get; set; }

        [Display(Name = "生日")]
        [Required(ErrorMessage = "{0}必填")]
        public DateTime Birthday { get; set; }

        [Display(Name = "種類")]
        [Required(ErrorMessage = "{0}必填")]
        public string SpeciesId { get; set; }
        public IEnumerable<SelectListItem> SpeciesItems { get; set; }

        [Display(Name = "品種")]
        [Required(ErrorMessage = "{0}必填")]
        public string BreedId { get; set; }
        public IEnumerable<SelectListItem> BreedItems { get; set; }

        [Display(Name = "結紮")]
        [Required(ErrorMessage = "{0}必填")]
        public string NeuteredId { get; set; }
        public IEnumerable<SelectListItem> NeuteredItems { get; set; }

        [Display(Name = "大頭照")]
        [Required(ErrorMessage = "{0}必填")]
        public string Photo { get; set; }

        [Display(Name = "體重(公斤)")]
        [Required(ErrorMessage = "{0}必填")]
        public decimal? Weight { get; set; }
    }
}