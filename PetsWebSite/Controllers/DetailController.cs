using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace PetsWebSite.Controllers
{
    public class DetailController : Controller
    {
        private readonly AppDbContext _dbContext;
        public DetailController()
        {
            _dbContext = new AppDbContext();
        }
        public ActionResult DepositAndConsumptionDetails()
        {
            int currentUserId = GetCurrentUserId();

            // 獲取儲值紀錄
            var depositRecords = _dbContext.DepositRecords
                .Where(d => d.MemberId == currentUserId)
                .OrderByDescending(d => d.DepositDate) // 按日期排序
                .ToList();

            // 獲取消費紀錄
            var consumptionRecords = _dbContext.BillDetails
         .Where(b => b.MemberId == currentUserId)
         .OrderByDescending(b => b.EndDate) // 使用正確的欄位名稱
          .ToList();

            var model = new DetailVm
            {
                DepositRecords = depositRecords,
                ConsumptionRecords = consumptionRecords,
                CurrentBalance = GetCurrentUserBalance(currentUserId)
            };

            return View(model);
        }
        private int GetCurrentUserId()
        {
            if (User.Identity.IsAuthenticated)
            {
                // 解密身份票證，获取存储的用户 ID
                var authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                if (authCookie != null)
                {
                    var ticket = FormsAuthentication.Decrypt(authCookie.Value);
                    if (ticket != null && !string.IsNullOrEmpty(ticket.UserData))
                    {
                        // UserData 包含用户 ID，返回解密后的用户 ID
                        return int.Parse(ticket.UserData);
                    }
                }
                throw new Exception("無法獲取用戶ID，請重新登入。");
            }
            throw new Exception("未登入");
        }



        private int GetCurrentUserBalance(int memberId)
        {
            var member = _dbContext.Members.FirstOrDefault(m => m.Id == memberId);
            return (int)(member != null ? member.AccountBalance : 0);
        }
    }
}