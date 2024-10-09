﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Dtos
{
    public class BookDateDto
    {
        public int MemberId { get; set; }

        public int PetId { get; set; }
        //public IEnumerable<SelectListItem> Pets { get; set; }  // 寵物下拉選單

        public DateTime SelectedDate { get; set; }
        //public IEnumerable<SelectListItem> AvailableDates { get; set; }  // 可預約日期下拉選單
        public int DoctorId { get; set; }
        //public IEnumerable<SelectListItem> Doctors { get; set; }  // 醫生下拉選單
        public int TimeSlotId { get; set; }
    }
}