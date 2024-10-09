using EmailBookingReminder.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailBookingReminder.Models.Repositories
{
    public class EmailBookingReminderRepository
    {
        private readonly AppDbContext _context;
        private readonly int _amount;

        public EmailBookingReminderRepository()
        {
            _context = new AppDbContext();
            _amount = 200;
        }

        public IEnumerable<BookRecord> GetRecord(DateTime currentTime, DateTime thresholdTime)
        {
            return _context.BookRecords
                .Where(br => br.BookTime >= currentTime && br.BookTime <= thresholdTime && br.IsStart == 0);
        }

        public Member GetAllCanSendEmailMember(int Id)
        {
            return _context.Members
             .AsNoTracking()
             .FirstOrDefault(m => m.Id == Id && m.Email != null);
        }

        public ManagerProfile GetBookedDoctor(int id)
        {
            return _context.ManagerProfiles
                .AsNoTracking()
                .FirstOrDefault(d => d.Id == id);
        }

        public async Task SendEmailEachOne(IEnumerable<BookRecord> upcomingBookings)
        {
            var emailTasks = new List<Task>();
            var newRecord = new List<BookRecord>();
            foreach (var booking in upcomingBookings)
            {
                var member = GetAllCanSendEmailMember(booking.MemberId);
                ManagerProfile doctor = GetBookedDoctor(booking.DoctorId);

                if (member != null && booking.IsStart == 0)
                {
                    try
                    {
                        var emailTask = SenderEmailExt.SendEmailReminder(member.Email, member.Name, booking, doctor);
                        emailTasks.Add(emailTask);
                        newRecord.Add(new BookRecord
                        {
                            Id = booking.Id,
                            MemberId = booking.MemberId,
                            PetId = booking.PetId,
                            StartDate = booking.StartDate,
                            BookTime = booking.BookTime,
                            BookTimeId = booking.BookTimeId,
                            DoctorId = booking.DoctorId,
                            DoctorName = booking.DoctorName,
                            IsStart = 0,
                        });
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                }
            }
            
            // 等待所有的 email 發送完成
            await Task.WhenAll(emailTasks);

            await UpdateRecord(newRecord, 1);
            // 在所有 email 發送完成後一次性保存資料庫變更
        }

        internal async Task UpdateRecord(IEnumerable<BookRecord> lateEndBookings, int state)
        {
            //foreach (var booking in lateEndBookings)
            //{
            //    booking.IsStart = state; // 將 IsStart 設定為傳入的 state
            //    _context.Entry(booking).State = EntityState.Modified; // 明確告訴 EF 這個實體已修改
            //}
            //var transaction = _context.Database.BeginTransaction();
            //try
            //{
            //    using (transaction)
            //    {
            //        await _context.SaveChangesAsync(); // 保存變更
            //    }
            //}
            //catch
            //{
            //    transaction.Rollback();
            //    // 捕捉到的例外直接拋出，保留堆疊信息以便調試
            //    throw;
            //}
            var transaction = _context.Database.BeginTransaction();
            try
            {
                foreach (var booking in lateEndBookings)
                {
                    // 重新從資料庫中查詢實體，以確保它是被追蹤的
                    var existingBooking = await _context.BookRecords.FindAsync(booking.Id);
                    if (existingBooking != null)
                    {
                        existingBooking.IsStart = state; // 更新 IsStart 狀態
                        _context.Entry(existingBooking).State = EntityState.Modified; // 設置狀態為修改
                    }
                }

                await _context.SaveChangesAsync(); // 保存變更
                transaction.Commit(); // 提交交易
            }
            catch
            {
                transaction.Rollback(); // 捕獲錯誤並回滾交易
                throw; // 保留原始錯誤信息
            }
        }

        internal void UpdateState(IEnumerable<BookRecord> lateEndBookings, int state)
        {
            foreach (var booking in lateEndBookings)
            {
                booking.IsStart = state; // 將 IsStart 設定為傳入的 state
                _context.Entry(booking).State = EntityState.Modified; // 明確告訴 EF 這個實體已修改
            }
            var transaction = _context.Database.BeginTransaction();
            try
            {
                using (transaction)
                {
                    _context.SaveChanges(); // 保存變更
                }
            }
            catch
            {
                transaction.Rollback();
                // 捕捉到的例外直接拋出，保留堆疊信息以便調試
                throw;
            }
        }


        internal void CreateBill(IEnumerable<BookRecord> lateEndBookings)
        {
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    foreach (var booking in lateEndBookings)
                    {
                        if (booking.IsStart == 1)
                        {
                            booking.IsStart = 3;
                            HandleCreateBillDetail(booking);
                        }
                        else
                        {
                            throw new Exception("Booking is end");
                        }
                        
                    }
                    _context.SaveChanges();
                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
            }
        }

        internal void CreateIncome(IEnumerable<BookRecord> lateEndBookings)
        {
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    foreach (var booking in lateEndBookings)
                    {
                        if (booking.IsStart == 1)
                        {
                            booking.IsStart = 3; 
                            HandleManagerIncomeDetail(booking);
                            _context.Entry(booking).State = EntityState.Modified;
                        }
                        else
                        {
                            throw new Exception("Booking is end");
                        }
                    }
                    _context.SaveChanges();
                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
            }
        }

        

        private BillDetail GetBillDetailByBookRecordId(int id)
        {
            return _context.BillDetails
                .AsNoTracking()
                .FirstOrDefault(b => b.BookRecordId == id);
        }

        private Member GetMemberById(int memberId)
        {
            return _context.Members
                .AsNoTracking()
                .FirstOrDefault(m => m.Id == memberId);
        }

        private PetProfile GetPetById(int petId)
        {
            return _context.PetProfiles
                .AsNoTracking()
                .FirstOrDefault(p => p.Id == petId);
        }

        public void HandleCreateBillDetail(BookRecord booking)
        {
            if (booking.IsStart != 3) throw new Exception("Booking is not late end");

            var pet = GetPetById(booking.PetId);
            if (pet == null) throw new Exception("Pet not found");

            var bill = new BillDetail
            {
                MemberId = booking.MemberId,
                PetId = booking.PetId,
                PetName = pet.Name,
                DoctorId = booking.DoctorId,
                DoctorName = booking.DoctorName,
                EndDate = DateTime.Now,
                Amount = _amount,
                BookRecordId = booking.Id
            };
            
            _context.BillDetails.Add(bill);
        }

        public void HandleManagerIncomeDetail(BookRecord booking)
        {
            if (booking.IsStart != 3) throw new Exception("Booking is not late end");

            var member = GetMemberById(booking.MemberId);
            if (member == null) throw new Exception("Member not found");

            var billDetail = GetBillDetailByBookRecordId(booking.Id);
            if (billDetail == null) throw new Exception("Bill detail not found");

            var income = new ManagerIncomeDetail
            {
                UserId = booking.DoctorId,
                MemberId = booking.MemberId,
                MemberName = member.Name,
                IncomeAmount = _amount,
                BillDetailsId = billDetail.Id,
                SettlementDate = DateTime.Now,
                IsEnd = true
            };
            booking.IsStart = 4;
            _context.ManagerIncomeDetails.Add(income); 
        }


        internal IEnumerable<BookRecord> GetRecordisStart(DateTime thresholdTime)
        {
            return _context.BookRecords
                .AsNoTracking()
               .Where(br => br.BookTime <= thresholdTime && br.IsStart == 1);
        }

    }
}
