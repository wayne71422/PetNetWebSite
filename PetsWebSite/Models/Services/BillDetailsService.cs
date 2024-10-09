using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace PetsWebSite.Models.Services
{
    public class BillDetailsService
    {
        private readonly BillDetailsRepository _repo;
        private readonly ManagerIncomeDetailsService _managerIncomeDetailsService;
        public readonly int _amount;

        public BillDetailsService()
        {
            _repo = new BillDetailsRepository();
            _managerIncomeDetailsService = new ManagerIncomeDetailsService();
            _amount = 200;
        }
        public Result CreateBillDetail(BookDateRecordDto dto)
        {
            
            if (dto == null) return Result.Fail("dto");
            if(dto.Id <= 0) return Result.Fail("Id 必須大於 0.");
            if (string.IsNullOrWhiteSpace(dto.PetName)) return Result.Fail("寵物名稱不可為空.");
            if (string.IsNullOrWhiteSpace(dto.DoctorName))  return Result.Fail("醫生名稱不可為空.");
            if (dto.StartDate == null) return Result.Fail("開始日期不可為空.");
            if((dto.BookTime)!=null) return Result.Fail("預約時間不可為空.");
            if(dto.IsStart == null || dto.IsStart ==0)  return Result.Fail("是否開始不可為空或尚未開始諮詢.");
            if(dto.IsStart == 2)
            {
                return HandleCreateBillDetail(dto);
            }
            if (dto.IsStart == 1)
            {
                Thread.Sleep(TimeSpan.FromMinutes(40));
                dto.IsStart = 2;
                if (dto.IsStart == 2)
                {
                    var result = HandleCreateBillDetail(dto);
                    return result;
                }
            }
            
            return Result.Fail("諮詢尚未開始");
        }

        private Result HandleCreateBillDetail(BookDateRecordDto dto)
        {
            int UpdateStat = 3;
            try {
                var bookRecord = _repo.GetBookRecordById(dto.Id);
                
                var bill = new BillDetail
                {
                    MemberId = bookRecord.MemberId,
                    PetId = bookRecord.PetId,
                    PetName = dto.PetName,
                    DoctorId = bookRecord.DoctorId,
                    DoctorName = dto.DoctorName,
                    EndDate = DateTime.Now,
                    Amount = _amount,
                    BookRecordId = dto.Id
                };
                
                var result = _repo.CreateBillDetail(bill);
                new BookDateRepository().UpdateBookingState(dto, UpdateStat);

                return result;
            }
            catch(Exception ex)
            {
                return Result.Fail(ex.Message);
            }
           
            
        }
    }
}