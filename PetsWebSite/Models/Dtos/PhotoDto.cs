using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Dtos
{
    public class PhotoDto
    {
        public int PetDiariesId { get; set; }
        public string FileName { get; set; }
        public DateTime UploadDate { get; set; }
        public string FilePath {  get; set; }
    }
}