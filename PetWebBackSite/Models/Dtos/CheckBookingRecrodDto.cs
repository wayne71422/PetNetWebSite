using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetWebBackSite.Models.Dtos
{
    public class CheckBookingRecrodDto
    {
        public int Id { get; set; }

        public int MemberId { get; set; }

        public string MemberName { get; set; }

        public int PetId { get; set; }

        public string PetName { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime BookTime { get; set; }

        public int BookTimeId { get; set; }

        public int? IsStart { get; set; }

        public string IsStartStr { get; set; }
    }
}