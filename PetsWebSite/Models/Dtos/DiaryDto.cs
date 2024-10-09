using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PetsWebSite.Models.EFModels;

namespace PetsWebSite.Models.Dtos
{
    public class DiaryDto
    {
        public int PetId { get; set; }
        public string Type { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public decimal Weight { get; set; }
        public DateTime DataDate { get; set; }

        public IEnumerable<Photo> Photos { get; set; }
    }
}