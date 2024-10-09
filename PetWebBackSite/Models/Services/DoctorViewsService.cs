using PetWebBackSite.Models.Dtos;
using PetWebBackSite.Models.EFModels;
using PetWebBackSite.Models.Repositories;
using PetWebBackSite.Models.ViewModels;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace PetWebBackSite.Models.Services
{
    public class DoctorViewsService
    {
        private readonly DoctorViewsRepository _repo;

        public DoctorViewsService()
        {
            _repo = new DoctorViewsRepository();
        }

        internal IEnumerable<CheckBookingRecrodDto> GetBookingRecordsByAccount(string account)
        {
            if (account == null) throw new Exception("查無此帳號，檢查是否錯誤或權限不符");
            IEnumerable <BookRecord> records = _repo.GetBookingRecords(account);
            if (records == null) throw new Exception("找不到帳號的諮詢記錄");
            var result = new List<CheckBookingRecrodDto>();
            foreach(var record in records)
            {
                var book = new CheckBookingRecrodDto();
                book = MvcApplication._mapper.Map<CheckBookingRecrodDto>(record); 
                book.MemberName = _repo.GetMemberNameById(record.MemberId);
                book.IsStartStr = GetStateByInt(record.IsStart.Value);
                book.PetName = _repo.GetPetNameById(record.PetId);
                result.Add(book);
            }
            return result;
        }

        internal ManagerIncomeDto GetMangerInacomeDetails(string account, ManagerIncomeDto vm)
        {
            if (account == null) throw new Exception("查無此帳號，檢查是否錯誤或權限不符");

            var records = GetIncomeWhichHaveVm(account, vm);
            if (records == null) throw new Exception("找不到帳號的收入記錄");

            var dto = new List<ManagerIncomeDetailsDto>();
            foreach (var record in records)
            {
                var income = new ManagerIncomeDetailsDto();
                income = MvcApplication._mapper.Map<ManagerIncomeDetailsDto>(record);

                dto.Add(income);
            }
            var vms = new ManagerIncomeDto();
            vms = vm;
            vms.ManagerIncomeDetails = dto;

            return vms;
        }

        private IEnumerable<ManagerIncomeDetail> GetIncomeWhichHaveVm(string account, ManagerIncomeDto vm)
        {
            if (vm.SelectRange==null&&vm.SelectYear==null&&vm.SelectMonth==null&&vm.SelecteTimeSpan==null)
            {
                return _repo.GetManagerIncomeDetais(account);
            }

            DateTime start;
            DateTime end;
            SelectVmTime(vm, out start, out end);

            return _repo.GetManagerIncomeDetais(account, start, end);
        }

        public static void SelectVmTime(ManagerIncomeDto vm, out DateTime startDate, out DateTime endDate)
        {
            startDate = DateTime.Now; // Initialize startDate to avoid CS0269 error
            endDate = startDate; // Initialize endDate to avoid CS0269 error

            if (vm.SelectRange == null && vm.SelecteTimeSpan != null) // 沒有選擇日期，只有選擇時間範圍
            {
                // 設置 startDate 為現在，endDate 為過去的時間範圍
                startDate = DateTime.Now.AddDays(-vm.SelecteTimeSpan.Value);
                endDate = DateTime.Now; // 確保 endDate 是現在時間
                vm.SelectRange = startDate; // 更新 vm 的選擇範圍
                
            }

            if (vm.SelectYear != null) // 選擇了年份
            {
                startDate = new DateTime((int)vm.SelectYear, 1, 1); // 以所選年份為起點
                endDate = startDate.AddYears(1).AddDays(-1); // 設定為該年的全年範圍
            }

            if (vm.SelectMonth != null) // 選擇了月份
            {
                // 設定 startDate 為該年份與月份的第一天
                startDate = new DateTime(vm.SelectYear ?? DateTime.Now.Year, (int)vm.SelectMonth, 1);
                endDate = startDate.AddMonths(1).AddDays(-1); // 設定為該月份的最後一天
            }

            if (vm.SelecteTimeSpan != null) // 如果有選擇時間範圍
            {
                // 調整 endDate 為 startDate 加上所選的時間範圍
                endDate = startDate.AddDays(vm.SelecteTimeSpan.Value);
            }

            //// 更新 vm 的選擇範圍
            //vm.SelectRange = startDate;
        }

        private string GetStateByInt(int isStart)
        {
            if (isStart == 0) return "尚未開始";
            if (isStart == 1) return "已通知但尚未開始";
            if (isStart == 2) return "已開始諮詢";
            if (isStart == 3) return "已結束諮詢";
            return "未出現狀態，這是不可能的!";
        }

        internal void ChangeEndState(int id)
        {
            if(id == 0) throw new Exception("找不到此筆收入記錄");
            _repo.UpdateManagerIncomeDetailById(id);
        }
    }
}