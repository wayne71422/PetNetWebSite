using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Dtos
{
    public class PetListDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public DateTime Birthday { get; set; }
        public string Species { get; set; }
        public string Breed { get; set; }
        public bool Neutered { get; set; }
        public string Photo { get; set; }
        public decimal Weight { get; set; }
    }
}