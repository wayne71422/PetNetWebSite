using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Dtos
{
    public class BookDateRecordDto
    {
        public int Id { get; set; }
        public string PetName { get; set; }
        public string DoctorName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime BookTime { get; set; }
        public int? IsStart { get; set; }

       
    }
}