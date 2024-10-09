﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetWebBackSite.Models.Dtos
{
    public class RegisterDto
    {
        public int Id { get; set; } // Assuming the ID is auto-generated by the database, it might not be necessary in the DTO for registration.

        public bool PermissionLevel { get; set; } // True for admin, false for regular users

        public string FullName { get; set; }

        public string Account { get; set; }

        public string Password { get; set; }

        public string DoctorBoolin { get; set; } // Indicates if the user is a doctor or not

        public string ProfilePicture { get; set; } // URL or file path to the profile picture

        public string Education { get; set; } // User's educational background

        public string Expertise { get; set; } // Area of expertise

        public string Name { get; set; } // This could be a display name or full name (to clarify if different from FullName)

        public string Gender { get; set; } // You could use 'M' or 'F' or an enum

        public string PhoneNumber { get; set; }

        public string Address { get; set; }
        public DateTime BirthDate { get; set; }

        public string LineCode { get; set; }
    }
}