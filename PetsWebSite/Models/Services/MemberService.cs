using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Infra;
using PetsWebSite.Models.Interface;
using PetsWebSite.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Services
{
    public class MemberService
    {
        private readonly IMemberRepository _repo;

        public MemberService()
        {
            _repo = new MemberRepository();

        }
        public MemberService(IMemberRepository repo)
        {
            _repo = repo;
        }
        public void Register(RegisterDto dto)
        {
            //判斷是否帳號已存在
            bool isAccountExist = _repo.IsAccountExist(dto.Email);
            if (isAccountExist) throw new Exception("帳號已存在");
            //建立新會員
            //為密碼進行維護            
            string hasPassword = HashUtility.ToSHA256(dto.Password);
            //加入confirm code
            string confirmCode = Guid.NewGuid().ToString("N");
            //建立新會員
            //dto.ConfirmCode = confirmCode;
            //dto.Password = hasPassword;
            //dto.IsConfirmed = false;
            Member member = new Member
            {
                Email = dto.Email,
                Password = hasPassword,
                Name = dto.Name,
                Mobile = dto.Mobile,
                IsConfirmed = false, // 預設為未啟用
                ConfirmCode = confirmCode
            };
            _repo.Create(member);
            string verificationUrl = $"{HttpContext.Current.Request.Url.Scheme}://{HttpContext.Current.Request.Url.Authority}/Members/VerifyEmailSucOrFail?memberId={member.Id}&confirmCode={confirmCode}";

            // 發送驗證信
            new EmailHelper().SendVerificationEmail(verificationUrl, member.Name, member.Email);
        }
        internal void ActiveRegister(int memberId, string confirmCode)
        {
            // 判斷 memberId 和 confirmCode 是否正確，正確就將會員狀態改為已啟用
            MemberDto dto = _repo.Get(memberId);
            if (dto == null) throw new Exception("會員不存在");
            if (dto.ConfirmCode != confirmCode) throw new Exception("驗證碼錯誤");
            if (dto.IsConfirmed.HasValue &&
                dto.IsConfirmed.Value)
            {
                throw new Exception("會員已啟用");
            }

            // 啟用會員
            _repo.Active(memberId);

        }

        public Result ValidateLogin(LoginDto dto)
        {
            // 根據 email 找出使用者
            MemberDto member = _repo.Get(dto.Email);
            if (member == null)
            {
                return Result.Fail("帳號或密碼錯誤");
            }

            // 檢查帳號是否已啟用
            if (!member.IsConfirmed.HasValue || member.IsConfirmed.Value == false)
            {
                return Result.Fail("帳號已註冊但尚未開通，請收取驗證信");
            }

            // 驗證密碼：將使用者輸入的密碼進行加密後與資料庫中加密的密碼比對
            string hashedInputPassword = HashUtility.ToSHA256(dto.Password); // 將使用者輸入的密碼進行加密
            bool isPasswordCorrect = (hashedInputPassword == member.Password); // 比對資料庫中儲存的加密密碼

            if (!isPasswordCorrect)
            {
                return Result.Fail("帳號或密碼錯誤");
            }

            return Result.Success();
        }
        public MemberDto GetMemberByEmail(string email)
        {
            var member = _repo.GetByEmail(email);
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

        public Result UpdateProfile(string email, EditProfileDto dto)
        {
            //update,name,email,mobile欄位值
            //直接叫用EF,或者仍叫用 IMemberRepository?
            //try
            //{

            MemberDto memberInDb = _repo.Get(email);
            memberInDb.Name = dto.Name;
            memberInDb.Mobile = dto.Mobile;
            memberInDb.Address = dto.Address;  // 更新地址字段

            _repo.Update(memberInDb);
            return Result.Success();
            //}
            //catch (Exception ex) {
            //return Result.Fail(ex.Message);
            //}


        }
        internal Result ChangePassword(string account, ChangePasswordDto dto)
        {
            var memberInDb = _repo.Get(account);

            string hashPassword = HashUtility.ToSHA256(dto.OriginalPassword);
            if (hashPassword.CompareTo(memberInDb.Password) != 0)
            {
                throw new Exception("原始密碼錯誤");
            }
            if (dto.OriginalPassword == dto.Password) return Result.Fail("原密碼不能與新密碼相同");
            if (dto.Password != dto.ConfirmPassword) return Result.Fail("新密碼必須與確認密碼相同");
            //update password 欄位值
            hashPassword = HashUtility.ToSHA256(dto.Password);
            memberInDb.Password = hashPassword;
            _repo.Update(memberInDb);
            return Result.Success();
        }
        public void VerifyEmailSucOrFail(int memberId, string confirmCode)
        {
            var member = _repo.Get(memberId);
            if (member == null)
            {
                throw new Exception("會員不存在");
            }

            if (member.ConfirmCode != confirmCode)
            {
                throw new Exception("驗證碼不正確");
            }

            if (member.IsConfirmed == true)
            {
                throw new Exception("帳號已經驗證過了");
            }

            // 更新會員狀態為已驗證
            member.IsConfirmed = true;
            member.ConfirmCode = null; // 清除驗證碼
            _repo.Update(member); // 更新會員資料
        }
    }
}