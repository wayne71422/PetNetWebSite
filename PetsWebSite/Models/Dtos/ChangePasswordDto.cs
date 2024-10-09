using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Dtos
{
    public class ChangePasswordDto
    {
        public string OriginalPassword { get; set; }

        public string Password { get; set; }

        public string ConfirmPassword { get; set; }
    }
}