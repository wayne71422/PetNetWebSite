using Microsoft.Ajax.Utilities;
using PetsWebSite.Models;
using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.Services;
using PetsWebSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Diagnostics;

namespace PetsWebSite.Controllers
{
    public class BookDateController : Controller
    {
        private readonly BookDateService _bookDateService;
        private readonly BillDetailsService _billDetailsService;
        private readonly ManagerIncomeDetailsService _managerIncomeDetailsService;
        

        public BookDateController()
        {
            _bookDateService = new BookDateService();
            _billDetailsService = new BillDetailsService();
            _managerIncomeDetailsService = new ManagerIncomeDetailsService();
             //"zhangsan@example.com";//
        }

        [Authorize]
		public ActionResult Book(int petId = 0)
		{
			var model = new BookDateVm();
            var member = _bookDateService.GetMember(User.Identity.Name).AccountBalance;
            if(member < 200)
			{
                return RedirectToAction("DepositPoints", "Deposit");
			}
			// 根據 petId 從資料庫取得對應的寵物名稱
			if (petId != 0)
			{
				var _petService = new PetService();
				var pet = _petService.GetPetsByPetId(petId); // 假設有個 service 取得寵物資訊
				model.PetId = petId;
				model.PetName = pet.Name;
			}

			return View(model);
		}


		public JsonResult GetPets()
        {
            var pets = _bookDateService.GetPetsByMember(User.Identity.Name)
                .Select(p => new SelectListItem { Value = p.Id.ToString(), Text = p.Name })
                .ToList();

            return Json(new { pets }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetDoctors()
        {
            var doctors = _bookDateService.GetDoctors().Select(d => new SelectListItem { Value = d.Id.ToString(), Text = d.Name })
        .ToList();

            return Json(new { doctors }, JsonRequestBehavior.AllowGet);
        }


        // ...

        public JsonResult GetAvailableDates(int doctorId)
        {
            if (!ModelState.IsValid)
            {
                return Json(new { success = false, message = "請選擇正確的醫生" }, JsonRequestBehavior.AllowGet);
            }

            var availableDates = _bookDateService.GetAvailableDates(doctorId);

            if (availableDates == null || !availableDates.Any())
            {
                // Change the return statement to show an alert in HTML
                return Json(new { success = false, message = "<script>alert('未找到可用的日期');</script>" }, JsonRequestBehavior.AllowGet);
            }

            return Json(new { success = true, availableDates }, JsonRequestBehavior.AllowGet);
        }


        public JsonResult GetAvailableTimeSlots(int doctorId, DateTime selectedDate)
        {
            if (!ModelState.IsValid)
            {
                return Json(new { success = false, message = "無效的請求" }, JsonRequestBehavior.AllowGet);
            }

            // 呼叫 service 層來獲取可用的時段
            var availableTimeSlots = _bookDateService.GetAvailableTimeSlots(doctorId, selectedDate);

            if (availableTimeSlots == null || !availableTimeSlots.Any())
            {
                return Json(new { success = false, message = "該日期無可用的時段" }, JsonRequestBehavior.AllowGet);
            }

            return Json(new { success = true, availableTimeSlots }, JsonRequestBehavior.AllowGet);
        }

        [Authorize]
        [HttpPost]
        public ActionResult SubmitBooking(BookDateVm vm)
        {
            // 調試輸出
            Debug.WriteLine($"PetId: {vm.PetId}");
            Debug.WriteLine($"DoctorId: {vm.DoctorId}");
            Debug.WriteLine($"SelectedDate: {vm.SelectedDate}");
            Debug.WriteLine($"TimeSlotId: {vm.TimeSlotId}");
            var checkMoney = _bookDateService.IsMemberBalanceValid(User.Identity.Name);
            if (!checkMoney) 
            {
                return Json(new { success = false, message = "餘額不足，請充值!" }, JsonRequestBehavior.AllowGet);
            }

            if (ModelState.IsValid == false)
            {
                return Json(new { success = false, message = "欄位錯誤!" }, JsonRequestBehavior.AllowGet);
            }

            var result = HandleSubmit(vm);
            if (result.IsSuccess)
            {
                return Json(new { success = true, message = "預約成功" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { success = false, message = "預約時段已被預約，請重新選擇!" }, JsonRequestBehavior.AllowGet);
            }
        }

        [Authorize]
        public ActionResult Success()
        {
            return View();
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
            dto.MemberId = _bookDateService.GetMemberIdByAccount(User.Identity.Name);
            Result result = _bookDateService.UpdateBalance(dto.MemberId);
            if (result.IsSuccess)
                return _bookDateService.CreateBooking(dto);
            else return Result.Fail("新增記錄失敗");
        }

        [Authorize]
        public ActionResult BookCheck()
        {
            var list = _bookDateService.GetBookRecord(User.Identity.Name);
            var result = new List<BookDateRecordVm>();
            foreach (var item in list)
            {
                var vm = MvcApplication._mapper.Map<BookDateRecordVm>(item);
                vm.StartDate = item.StartDate.ToString("yyyy年MM月dd日 HH:mm");
                vm.BookTime = item.BookTime.ToString("yyyy年MM月dd日 HH:mm");
                result.Add(vm);
            }

            return View(result);
        }

        [Authorize]
        [HttpPost]
        public ActionResult BookCheck(int id)
        {
            BookDateRecordDto vm = _bookDateService.GetBookRecord(id);
            const int newState = 2;
            if (vm == null)
            {
                ModelState.AddModelError(string.Empty, "沒有抓取到資料，請重新再試");
                return RedirectToAction("BookCheck");
            }

            if (vm.IsStart == 0)
            {
                // 設置 ModelState 錯誤，這樣我們可以在前端捕捉並顯示
                throw new Exception("諮詢尚未開始");

            }
            var updateStart = _bookDateService.UpdateBookingState(vm, newState);// 更新為已開始諮詢
            // 成功後重導向到 StarDate
            return RedirectToAction("StarDate", new { id = id });
        }

  //      public JsonResult CancleCheck()
		//{
		//	string script = @"
  //              if (confirm('確定要刪除嗎？')) {
  //                  window.location.href = '" + Url.Action("Delete", "BookDate") + @"';
  //              } else {
  //                  alert('已取消操作');
  //              }";

		//	return Json(script, JsonRequestBehavior.AllowGet);
		//}

        [Authorize]
		[HttpPost]
		public ActionResult BookCancle(int id)
		{
			var vm = _bookDateService.GetBookRecord(id);
			if (vm == null)
			{
				ModelState.AddModelError(string.Empty, "沒有抓取到資料，請重新再試");
				return RedirectToAction("BookCheck");
			}

			Result result = _bookDateService.DeleteBookingUpdate(vm);
			if (result.IsSuccess)
			{
				return RedirectToAction("BookCheck", new { message = "取消成功" });
			}
			else
			{
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
				return RedirectToAction("BookCheck");
			}
		}

        [Authorize]
        public ActionResult StarDate(int id)
        {
            
            var bookDate = _bookDateService.GetBookRecord(id);
            
            
            var vm = MvcApplication._mapper.Map<BookDateRecordVm>(bookDate);
            
             

            return View(vm);
        }

        [Authorize]
        [HttpPost]
        public ActionResult StarDate(BookDateRecordVm vm)
        {
            var bookDate = _bookDateService.GetBookRecord(vm.Id);
            var dto = MvcApplication._mapper.Map<BookDateRecordDto>(bookDate);
            var result = _billDetailsService.CreateBillDetail(dto);  // 建立帳單

            if (result.IsSuccess == false)
            {
                ModelState.AddModelError(string.Empty, result.ErrorMessage);
                return RedirectToAction("BookCheck");
            }

            if (result.IsSuccess)
            {
                result = _managerIncomeDetailsService.CreateIncomeDetails(dto);
            }
            else
            {
                ModelState.AddModelError(string.Empty, result.ErrorMessage);
                return RedirectToAction("StarDate");
            }
            return RedirectToAction("BookCheck");
        }

		[Authorize]
		public ActionResult GetAccountBalance()
		{
			var member = _bookDateService.GetMember(User.Identity.Name);
			return Json(new { accountBalance = member.AccountBalance }, JsonRequestBehavior.AllowGet);
		}
	}

}