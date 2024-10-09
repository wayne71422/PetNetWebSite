using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;

using PetsWebSite.Models.Interface;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Repositories
{
    public class MemberRepository : IMemberRepository
    {
        private AppDbContext _db;

        public MemberRepository()
        {
            _db = new AppDbContext();

        }
        public MemberRepository(AppDbContext db)
        {
            _db = db;
        }
        public void Create(Member member)
        {
            
            try
            {
                _db.Members.Add(member);
                _db.SaveChanges();
            }
            catch (Exception ex)
            {
                // 記錄例外，查看具體錯誤
                Console.WriteLine($"Exception occurred while saving member: {ex.Message}");
                throw;
            }
        }
        public MemberDto Get(int memberId)
        {
            var member = _db.Members.AsNoTracking().FirstOrDefault(x => x.Id == memberId);
            if (member == null) return null;
            return new MemberDto
            {
                Id = member.Id,  // 確保這裡的 Id 是來自資料庫的會員 ID
                Email = member.Email,
                Name = member.Name,
                Mobile = member.Mobile,
                ConfirmCode = member.ConfirmCode,
                IsConfirmed = member.IsConfirmed,
            };
        }
        public Member GetByEmail(string email)
        {
            return _db.Members.AsNoTracking().FirstOrDefault(x => x.Email == email);
        }
        public void Active(int memberId)
        {
            var member = _db.Members.FirstOrDefault(x => x.Id == memberId);
            member.IsConfirmed = true;
            member.ConfirmCode = null;

            _db.SaveChanges();
        }

        public bool IsAccountExist(string email)
        {
            var member = _db.Members.AsNoTracking().FirstOrDefault(x => x.Email == email);

            return member != null;
        }
        public MemberDto Get(string email)
        {
            var member = _db.Members
                .AsNoTracking()
                .FirstOrDefault(x => x.Email == email);
            if (member == null) return null;

            // 手動填充 MemberDto，確保包括密碼欄位
            return new MemberDto
            {
                Id = member.Id,
                Email = member.Email,
                Name = member.Name,
                Mobile = member.Mobile,
                ConfirmCode = member.ConfirmCode,
                IsConfirmed = member.IsConfirmed,
                Password = member.Password,// 確保回傳加密的密碼
                Address = member.Address,
            };
        }

        public void Update(MemberDto dto)
        {
            var db = new AppDbContext();
            Member member = MvcApplication._mapper.Map<Member>(dto);
            db.Entry(member).State = System.Data.Entity.EntityState.Modified;

            db.SaveChanges();
        }

    }
    
}
