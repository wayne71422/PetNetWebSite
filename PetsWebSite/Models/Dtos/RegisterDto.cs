﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Dtos
{
    public class RegisterDto
    {
        public int Id { get; set; }

        public string Password { get; set; }
        //public string ConfirmPassword { get; set; }		
        public string Email { get; set; }
        public string Name { get; set; }
        public string Mobile { get; set; }
        public string EncryptedPassword { get; set; }
        public decimal AccountBalance { get; set; }
        public string ConfirmCode { get; set; }
        public bool? IsConfirmed { get; set; }
    }
}