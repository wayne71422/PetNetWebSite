using PetsWebSite.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Repositories
{
    public class MembersRepository
    {
        private readonly AppDbContext _dbContext;

        public MembersRepository()
        {
            _dbContext = new AppDbContext();
        }

        public Member GetMemberByAccount(string account)
        {
            return _dbContext.Members
                .AsNoTracking()
                .FirstOrDefault(m => m.Email == account);
        }

        public Member GetMemberById(int id)
        {
            return _dbContext.Members
                .AsNoTracking()
                .FirstOrDefault(m => m.Id == id);
        }

        public void UpdateMember(Member member)
        {
            var oldMember = _dbContext.Members.FirstOrDefault(m => m.Id == member.Id);
            if (oldMember != null)
            {
                oldMember.Name = member.Name;
                oldMember.Email = member.Email;
                oldMember.Password = member.Password;
                oldMember.Mobile = member.Mobile;
                oldMember.AccountBalance = member.AccountBalance;
                oldMember.IsConfirmed = member.IsConfirmed;
                oldMember.ConfirmCode = member.ConfirmCode;
                oldMember.Address = member.Address;
            }
            _dbContext.SaveChanges();
        }
    }
}