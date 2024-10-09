using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Services;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace PetsWebSite.Models.Repositories
{
    public class BookDateRepository
    {
        private readonly AppDbContext _dbContext;

        public BookDateRepository()
        {
            _dbContext = new AppDbContext();
        }

        public IEnumerable<BookRecord> GetBookingsByMemberId(int memberId)
        {
            var bookings = _dbContext.BookRecords
                .AsNoTracking()
                .Where(b => b.MemberId == memberId)
                .OrderByDescending(i=>i.BookTime)
                .ToList();
            return bookings;
        }

        public BookRecord GetBookingByMemberId(int memberId)
        {
            var booking = _dbContext.BookRecords
                .AsNoTracking()
                .FirstOrDefault(b => b.MemberId == memberId);
            return booking;
        }

        public Member GetMemberByAccount(string account)
        {
            var member = _dbContext.Members
                .AsNoTracking()
                .FirstOrDefault(m => m.Email == account);
            return member;
        }

        public IEnumerable<PetProfile> GetPetsByMemberId(int memberId)
        {
            var petResult = _dbContext.PetProfiles
                .AsNoTracking()
                .Where(p => p.MemberId == memberId).ToList();
            return petResult;
        }

        public IEnumerable<ManagerProfile> GetDoctors()
        {
            var doctors = _dbContext.ManagerProfiles
                .AsNoTracking()
                .Where(m => m.DoctorBoolin == "1").ToList();
            return doctors;
        }

        public IEnumerable<DateTime> GetAvailableDatesByDoctor(int doctorId)
        {
            return _dbContext.BookRecords
                .AsNoTracking()
                .Where(b => b.DoctorId == doctorId)
                .Select(b => b.StartDate)
                .Distinct()
                .ToList();
        }

        public IEnumerable<int> GetBookedTimeSlots(int doctorId, DateTime selectedDate)
        {
            var timeSlots = _dbContext.BookRecords
                .AsNoTracking()
                .Where(b => b.DoctorId == doctorId && b.StartDate == selectedDate)
                .Select(b => b.BookTimeId)
                .ToList();
            
            return timeSlots;
        }

        public IEnumerable<BookTime> GetAvailableTimeSlots()
        {
            var bookTime = _dbContext.BookTimes
                .AsNoTracking()
                .ToList();
            return bookTime;
        }

        public BookTime GetTimeSlot(int id)
        {
            var bookTime = _dbContext.BookTimes
                .AsNoTracking()
                .FirstOrDefault(i => i.Id == id);
            return bookTime;
        }

        public void CreateBooking(BookRecord newBooking)
        {
            _dbContext.BookRecords.Add(newBooking);
            _dbContext.SaveChanges();
        }

        internal string GetAvailableTime(int timeSlotId)
        {
            var timeString = _dbContext.BookTimes
                .FirstOrDefault(c => c.Id == timeSlotId)
                .BookTime1
                .ToString();
            if (timeString == null) return null;
            return timeString;
        }

        public bool HasAvailableTimeSlots(int doctorId, DateTime date)
        {
            // 1. 獲取該醫生在特定日期的所有已預約時段
            var bookedTimeSlotIds = _dbContext.BookRecords
                .AsNoTracking()
                .Where(b => b.DoctorId == doctorId
                    && b.BookTime.Year == date.Year
                    && b.BookTime.Month == date.Month
                    && b.BookTime.Day == date.Day)  // 改為直接比較年、月、日
                .Select(b => b.BookTimeId)  // 注意這裡應該是指向BookTime的外鍵
                .ToList();

            // 2. 獲取該醫生當天的所有可預約時段
            var availableTimeSlots = _dbContext.BookTimes
                .Where(bt => !bookedTimeSlotIds.Contains(bt.Id)) // 排除已預約的時段
                .ToList();

            // 如果仍有可預約的時段，返回 true，表示該天有可用時段
            return availableTimeSlots.Any();
        }

        public IEnumerable<BookTime> GetAvailableTimeSlotsByDoctorAndDate(int doctorId, DateTime date)
        {
            // 1. 獲取該醫生在該日期的已預約時段的ID
            var bookedTimeSlotIds = _dbContext.BookRecords
                .AsNoTracking()
                .Where(b => b.DoctorId == doctorId
                    && b.BookTime.Year == date.Year
                    && b.BookTime.Month == date.Month
                    && b.BookTime.Day == date.Day
                    && b.IsStart != 5)  // 改成年、月、日比較
                .Select(b => b.BookTimeId)  // 指向BookTime的外鍵
                .ToList();

            // 2. 獲取所有該日期的時段，並排除已經被預約的時段
            var availableTimeSlots = _dbContext.BookTimes
                .Where(bt => !bookedTimeSlotIds.Contains(bt.Id))  // 排除被預約的時段
                .ToList();

            return availableTimeSlots;
        }

        public Result UpdateBookingState(BookDateRecordDto dto,int updateState)
        {
            var updateBooking = _dbContext.BookRecords
                .FirstOrDefault(b => b.Id == dto.Id);

            if (updateBooking == null) return Result.Fail("找不到預約紀錄");

            updateBooking.IsStart = updateState;

            _dbContext.SaveChanges();

            return Result.Success();
        }

        internal BookRecord GetBookingById(int id)
        {
            return _dbContext.BookRecords.FirstOrDefault(i => i.Id == id);
        }

        internal IEnumerable<BookDateRecordDto> GeyBookDateRecords(int id)
        {
            var record = _dbContext.BookRecords
                .AsNoTracking()
                .Include(b => b.Member)
                .Include(b => b.PetProfile)
                .Include(b => b.BookTime1)
                .Where(b => b.MemberId == id)
                .OrderByDescending(i => i.BookTime)
                .Select(x => new BookDateRecordDto
                {
                    PetName = x.PetProfile.Name,
                    DoctorName = x.DoctorName,
                    StartDate = x.StartDate,
                    BookTime = x.BookTime,
                    IsStart = x.IsStart,
                    Id = x.Id,
                });
            return record;
        }

		internal Result DeleteBookingUpdate(int id)
		{
			var booking = _dbContext.BookRecords
                .Include(b => b.Member)
				.FirstOrDefault(b => b.Id == id);
            if (booking == null) return Result.Fail("找不到預約紀錄");
            booking.IsStart = 5;
            
            booking.Member.AccountBalance += 200;
            
			_dbContext.SaveChanges();
			return Result.Success();
		}
	}

}