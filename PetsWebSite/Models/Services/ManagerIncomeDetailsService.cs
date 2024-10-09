using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Repositories;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;

namespace PetsWebSite.Models.Services
{
    public class ManagerIncomeDetailsService
    {
        private readonly BillDetailsRepository _BillDetailsRepo;
        private readonly ManagerIncomeDetailsRepository _repo;

        public ManagerIncomeDetailsService()
        {
            _BillDetailsRepo = new BillDetailsRepository();
            _repo = new ManagerIncomeDetailsRepository();
        }
        public Result CreateIncomeDetails(BookDateRecordDto dto)
        {
            var bookRecord = _BillDetailsRepo.GetBookRecordById(dto.Id);
            var billDetail = _BillDetailsRepo.GetBillDetailByBookRecordId(dto.Id);
            
            var income = new ManagerIncomeDetail
            {
                UserId = bookRecord.DoctorId,
                MemberId = bookRecord.MemberId,
                MemberName = bookRecord.Member.Name,
                BillDetailsId = billDetail.Id,
                IncomeAmount = billDetail.Amount,
                SettlementDate = DateTime.Now,
                IsEnd = false,
            };

            try
            {
                return _repo.CreateIncomeDetails(income);
            }
            catch (Exception e)
            {
                return Result.Fail(e.Message);
            }

        }

    }
}