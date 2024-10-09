using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.Services;
using PetsWebSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Principal;
using System.Web.Http;
using System.Web.Mvc;
using HttpGetAttribute = System.Web.Mvc.HttpGetAttribute;
using HttpPostAttribute = System.Web.Mvc.HttpPostAttribute;
using RouteAttribute = System.Web.Mvc.RouteAttribute;
using RoutePrefixAttribute = System.Web.Mvc.RoutePrefixAttribute;

namespace PetsWebSite.Controllers.Api
{
	[RoutePrefix("api/BookDate")]
	public class BookDateController : ApiController
	{
		private readonly BookDateService _bookDateService;
		private readonly string Account;

		public BookDateController(BookDateService bookDateService)
		{
			_bookDateService = bookDateService;
			Account = "zhangsan@example.com";//User.Identity.Name;
		}

		// GET: api/BookDate/GetDoctors
		[HttpGet]
		[Route("GetDoctors")]
		public IHttpActionResult GetDoctors()
		{
			var doctors = _bookDateService.GetDoctors(); // 改為同步方法
			if (doctors == null || doctors.Count() == 0)
			{
				return NotFound();
			}
			return Ok(doctors);
		}

		// GET: api/BookDate/GetPets
		[HttpGet]
		[Route("GetPets")]
		public IHttpActionResult GetPets()
		{
			var pets = _bookDateService.GetPetsByMember(Account); // 改為同步方法
			if (pets == null || pets.Count() == 0)
			{
				return NotFound();
			}
			return Ok(pets);
		}

		// GET: api/BookDate/GetAvailableDates
		[HttpGet]
		[Route("GetAvailableDates")]
		public IHttpActionResult GetAvailableDates(int doctorId)
		{
			var availableDates = _bookDateService.GetAvailableDates(doctorId); // 改為同步方法
			if (availableDates == null || availableDates.Count() == 0)
			{
				return NotFound();
			}
			return Ok(availableDates);
		}

		// GET: api/BookDate/GetAvailableTimeSlots
		[HttpGet]
		[Route("GetAvailableTimeSlots")]
		public IHttpActionResult GetAvailableTimeSlots(int doctorId, DateTime selectedDate)
		{
			var availableTimeSlots = _bookDateService.GetAvailableTimeSlots(doctorId, selectedDate); // 改為同步方法
			if (availableTimeSlots == null || availableTimeSlots.Count() == 0)
			{
				return NotFound();
			}
			return Ok(availableTimeSlots);
		}

		// POST: api/BookDate/SubmitBooking
		[HttpPost]
		[Route("SubmitBooking")]
		public IHttpActionResult SubmitBooking([FromBody] BookDateVm vm)
		{
			if (ModelState.IsValid == false)
				return NotFound();

			var result = HandleSubmit(vm);
			if (result.IsSuccess == true)
				return Ok(new { message = "Booking submitted successfully" });
			else
			{
				ModelState.AddModelError("", result.ErrorMessage);
				return NotFound();
			}
		}

		private Result HandleSubmit(BookDateVm vm)
		{
			//var dto = new BookDateDto
			//{
			//    MemberId = _bookDateService.GetMemberIdByAccount(Account),
			//    PetId = vm.PetId,
			//    DoctorId = vm.DoctorId,
			//    BookDate = vm.SelectedDate.Value,
			//    TimeSlotId = vm.TimeSlotId
			//};
			var dto = MvcApplication._mapper.Map<BookDateDto>(vm);
			dto.MemberId = _bookDateService.GetMemberIdByAccount(Account);

			return _bookDateService.CreateBooking(dto);
		}
	}
}
