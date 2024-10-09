using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.ViewModels
{
    public class PetListVm
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Gender { get; set; }
        public string Birthday { get; set; }
        [Required]
        public string Species { get; set; }
        [Required]
        public string Breed { get; set; }
        public string Neutered { get; set; }
        public string Photo { get; set; }
        public decimal Weight { get; set; }
    }
}