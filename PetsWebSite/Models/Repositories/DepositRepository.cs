using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Repositories
{
    public class DepositRepository : IDepositRepository
    
    {
        private readonly AppDbContext _db;

        public DepositRepository(AppDbContext db)
        {
            _db = db;
        }
        

        public void CreateDepositRecord(DepositDto dto)
        {
            var depositRecord = new DepositRecord
            {
                MemberId = dto.MemberId,
                DepositAmount = dto.DepositAmount,
                DepositDate = dto.DepositDate
            };

            _db.DepositRecords.Add(depositRecord);
            _db.SaveChanges();
        }

        public decimal GetMemberBalance(int memberId)
        {
            var member = _db.Members.FirstOrDefault(m => m.Id == memberId);
            return member?.AccountBalance ?? 0;
        }

        public void UpdateMemberBalance(int memberId, decimal newBalance)
        {
            var member = _db.Members.FirstOrDefault(m => m.Id == memberId);
            if (member != null)
            {
                member.AccountBalance = newBalance;
                _db.SaveChanges();
            }
        }
    }
}