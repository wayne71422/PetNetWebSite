using PetsWebSite.Models.Apis;
using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Exts;
using PetsWebSite.Models.Repositories;
using PetsWebSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace PetsWebSite.Models.Services
{
    public class BookDateService
    {
        private readonly BookDateRepository _bookDateDao;
        private readonly MembersRepository _MemberRepo;
        private readonly PetProfilesRepository _PetProfilesRepo;
        private readonly ManagerProfilesRepository _ManagerRepo;       

        public BookDateService()
        {
            _bookDateDao = new BookDateRepository();
            _MemberRepo = new MembersRepository(); 
            _PetProfilesRepo = new PetProfilesRepository();
            _ManagerRepo = new ManagerProfilesRepository();
        }


		public IEnumerable<PetProfile> GetPetsByMember(string account)
        {
            if (account == null) throw new Exception("帳號為空，尚未登入，請重新登入");

            var member = _bookDateDao.GetMemberByAccount(account);
            if (member == null) throw new Exception("帳號尚未開通，請開通後再登錄");

            var pets = _bookDateDao.GetPetsByMemberId(member.Id);
            if (pets == null) throw new Exception("親，您沒有寵物喔!請新增寵物後再進行預約");
 
            return pets;
        }

        public IEnumerable<ManagerProfile> GetDoctors()
        {
            var repo = new ManagerProfilesRepository();
            var doctors = repo.GetDoctors();

            return doctors;
        }

        public IEnumerable<SelectListItem> GetAvailableDates(int doctorId)
        {
            var today = DateTime.Today;
            var futureDates = Enumerable.Range(0, 14).Select(i => today.AddDays(i));

            // 從 DAO 層獲取每個日期可預約的時段
            var availableDates = futureDates
                .Where(date => _bookDateDao.HasAvailableTimeSlots(doctorId, date)) // 僅保留有可用時段的日期
                .Select(date => new SelectListItem
                {
                    Value = date.ToString("yyyy-MM-dd"),
                    Text = date.ToString("yyyy-MM-dd")
                });

            return availableDates;
        }

        public IEnumerable<SelectListItem> GetAvailableTimeSlots(int doctorId, DateTime selectedDate)
        {
            var currentDate = DateTime.Today;
            var currentTime = DateTime.Now.TimeOfDay;

            var availableTimeSlots = _bookDateDao
                .GetAvailableTimeSlotsByDoctorAndDate(doctorId, selectedDate)
                .Where(timeSlot =>
                {
                    // 將 BookTime1 (string) 轉換為 TimeSpan
                    TimeSpan bookTime;
                    bool isValidTime = TimeSpan.TryParse(timeSlot.BookTime1, out bookTime);

                    // 檢查轉換是否成功，並且過濾掉比當前時間早的時段
                    return isValidTime && (selectedDate.Date != currentDate || bookTime > currentTime);
                })
                .Select(timeSlot => new SelectListItem
                {
                    Value = timeSlot.Id.ToString(),
                    Text = timeSlot.BookTime1 // 顯示例如: "10:00 - 11:00"
                });

            return availableTimeSlots;
        }

        public string GetTimeString (BookDateDto dto)
        {
            var timeString = _bookDateDao.GetAvailableTime(dto.TimeSlotId);
            if (timeString == null)
            {
                throw new Exception("查無此此時間段");
            }
            return timeString;
        }

        public Result CreateBooking(BookDateDto dto)
        {
            //var newBooking = new BookRecord
            //{
            //    MemberId = dto.MemberId,
            //    PetId = dto.PetId,
            //    DoctorId = dto.DoctorId,
            //    StartDate = dto.BookDate,
            //    BookTimdId = dto.TimeSlotId,
            //    IsStart = false
            //};
            
            if (dto == null) return Result.Fail("欄位不可為空");
            var newBooking = MvcApplication._mapper.Map<BookRecord>(dto);
            
            newBooking.StartDate = DateTime.Now;
            newBooking.BookTime = DateTimeHelperExt.CombineDateAndTime(dto.SelectedDate, GetTimeString(dto));
            newBooking.BookTimeId = dto.TimeSlotId;
            newBooking.DoctorName = _ManagerRepo.GetDoctor(dto.DoctorId).Name;
            newBooking.IsStart = 0;

            _bookDateDao.CreateBooking(newBooking);

            return Result.Success();
        }

        internal int GetMemberIdByAccount(string name)
        {
            var db = new AppDbContext();
            var memberId = db.Members.FirstOrDefault(c => c.Email == name);

            if (memberId == null) 
            {
                throw new Exception("查無此帳號");
            }
            return memberId.Id;
        }

        internal IEnumerable<BookDateRecordDto> GetBookRecord(string account)
        {
            //var list = new List<BookDateRecordDto>();

            var member = _MemberRepo.GetMemberByAccount(account);
            //var bookRecords = _bookDateDao.GetBookingsByMemberId(member.Id);
            var bookDateRecord = _bookDateDao.GeyBookDateRecords(member.Id);

            //foreach (var book in bookRecords) 
            //{
            //    var dto = new BookDateRecordDto(); // 創建新的 dto 物件

            //    dto.Id = book.Id;
            //    dto.PetName = _PetProfilesRepo.GetPetByPetId(book.PetId).Name;
            //    dto.DoctorName = _ManagerRepo.GetDoctor(book.DoctorId).FullName;
            //    dto.StartDate = book.BookTime;
            //    dto.BookTime = _bookDateDao.GetTimeSlot(book.BookTimeId).BookTime1;
            //    dto.IsStart = book.IsStart;
            //    list.Add(dto);
            //}
            
            return bookDateRecord;
        }

        internal Result UpdateBookingState(BookDateRecordDto dto,int upState)
        {
            if(dto == null) return Result.Fail("傳入值不可為空");
            try
            {
                var result = _bookDateDao.UpdateBookingState(dto, upState);
                
                return Result.Success();
            }
            catch (Exception ex)
            {
                return Result.Fail(ex.Message);
            } 
        }

        //internal BookRecord GetBookRecordById(int id)
        //{
        //    return _bookDateDao.GetBookingById(id);
        //}

        internal BookDateRecordDto GetBookRecord(int id)
        {
            var dto = new BookDateRecordDto();

            var book = _bookDateDao.GetBookingById(id);

                dto.Id = book.Id;
                dto.PetName = _PetProfilesRepo.GetPetByPetId(book.PetId).Name;
                dto.DoctorName = _ManagerRepo.GetDoctor(book.DoctorId).FullName;
                dto.StartDate = book.StartDate;
                dto.BookTime = book.BookTime;
                dto.IsStart = book.IsStart;              

            return dto;
        }

        internal bool IsMemberBalanceValid(string account)
        {
            if(account == null) throw new Exception("抓不到帳號資料");
            var member = _MemberRepo.GetMemberByAccount(account);
            if (member == null) throw new Exception("查無此帳號");
            if (member.AccountBalance < 200) return false;
            else return true;
        }

        internal Result UpdateBalance(int memberId)
        {
            if (memberId == 0) throw new Exception("不可能沒有會員ID");
            var member = _MemberRepo.GetMemberById(memberId);
            member.AccountBalance = member.AccountBalance - 200;
            if (member.AccountBalance < 0) return Result.Fail("餘額不足");
            try {
                _MemberRepo.UpdateMember(member);
                return Result.Success();
            }
            catch (Exception ex) 
            {
                return Result.Fail(ex.Message);
            }
            
        }

		internal Result DeleteBookingUpdate(BookDateRecordDto vm)
		{
			if(vm==null) return Result.Fail("傳入值不可為空");
            if(vm.IsStart== 1) return Result.Fail("已開始的預約不可刪除");
            try
			{
				Result result = _bookDateDao.DeleteBookingUpdate(vm.Id);
				return Result.Success();
			}
			catch (Exception ex)
			{
				return Result.Fail(ex.Message);
			}
		}

		internal Member GetMember(string name)
		{
			if (name == null) throw new Exception("帳號為空，尚未登入，請重新登入");
            if (name.Length == 0) throw new Exception("帳號為空，尚未登入，請重新登入");
            if (name == "") throw new Exception("帳號為空，尚未登入，請重新登入");
            return _MemberRepo.GetMemberByAccount(name);
		}
	}
}