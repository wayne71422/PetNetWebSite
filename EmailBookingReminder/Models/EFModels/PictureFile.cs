namespace EmailBookingReminder.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PictureFile
    {
        public int Id { get; set; }

        public string MediaPath { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        public int DisplayOrder { get; set; }

        public DateTime LastModified { get; set; }
    }
}
