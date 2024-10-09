using PetWebBackSite.Models.Dtos;
using PetWebBackSite.Models.EFModels;
using PetWebBackSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace PetWebBackSite.Models.Repositories
{
    public class DoctorViewsRepository
    {
        private readonly AppDbContext _db;

        public DoctorViewsRepository()
        {
            _db = new AppDbContext();  
        }
        internal IEnumerable<BookRecord> GetBookingRecords(string account)
        {
            var doctorId = GetDoctorIdByAccount(account);
            return _db.BookRecords.AsNoTracking()
                .Where(x => x.DoctorId == doctorId)
                .OrderByDescending(x=>x.BookTime)
                .ToList();
        }

        internal IEnumerable<ManagerIncomeDetail> GetManagerIncomeDetais(string account)
        {
            var doctorId = GetDoctorIdByAccount(account);
            return _db.ManagerIncomeDetails
                    .AsNoTracking()
                    .Where(x => x.UserId == doctorId).ToList();
        }

        internal IEnumerable<ManagerIncomeDetail> GetManagerIncomeDetais(string account, DateTime startDate,DateTime endDate)
        {
            var doctorId = GetDoctorIdByAccount(account);

            return _db.ManagerIncomeDetails.AsNoTracking()
                    .Where(x => x.UserId == doctorId && x.SettlementDate >= startDate && x.SettlementDate <= endDate)
                    .ToList();
        }

        public int GetDoctorIdByAccount(string account)
        {
            return _db.ManagerProfiles
                //.AsNoTracking()
                .FirstOrDefault(x => x.Account == account)
                .Id;
        }

        internal string GetMemberNameById(int memberId)
        {
            return _db.Members
                .AsNoTracking()
                .FirstOrDefault(x => x.Id == memberId)
                .Name;
        }

        internal string GetPetNameById(int petId)
        {
            return _db.PetProfiles
                .AsNoTracking()
                .FirstOrDefault(x => x.Id == petId)
                .Name;
        }

        internal void UpdateManagerIncomeDetailById(int id)
        {
            var detail = _db.ManagerIncomeDetails
                .FirstOrDefault(x => x.Id == id);
            if (detail == null) throw new Exception("找不到此筆收入記錄");
            detail.IsEnd = true;
            _db.SaveChanges();
        }
    }
}