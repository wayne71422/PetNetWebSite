using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PetsWebSite.Models.EFModels;

namespace PetsWebSite.Models.ViewModels
{
    public class PhotoAlbumsVm
    {
        public int Id { get; set; }

        //public int? PetDiariesId { get; set; }

        [Required]
        [StringLength(70)]
        public string FileName { get; set; }

        [Required]
        [StringLength(255)]
        public string FilePath { get; set; }

        [Column(TypeName = "date")]
        public DateTime UploadDate { get; set; }

        //public virtual PetDiary PetDiary { get; set; }

        public virtual ICollection<PetsTag> PetsTags { get; set; }
    }
}