namespace PetsWebSite.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PetsTag")]
    public partial class PetsTag
    {
        public int Id { get; set; }

        public int PetProfilesId { get; set; }

        public int PhotoId { get; set; }

        public virtual PetProfile PetProfile { get; set; }

        public virtual Photo Photo { get; set; }
    }
}
