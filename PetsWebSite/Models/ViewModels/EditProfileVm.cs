using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.ViewModels
{
    public class EditProfileVm
    {
        [Display(Name = "姓名")]
        [Required]
        [StringLength(30)]
        public string Name { get; set; }

        [Display(Name = "手機號碼")]
        [StringLength(10)]
        public string Mobile { get; set; }


        public string Address { get; set; }

    }
}