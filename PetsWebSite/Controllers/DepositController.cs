using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.Services;
using PetsWebSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using PetsWebSite.Models.Repositories;
using PetsWebSite.Models.EFModels;
using System.Web.Security;
using PetsWebSite.Models.Interface;

namespace PetsWebSite.Controllers
{
    [Authorize]
    public class DepositController : Controller
    {
        private readonly DepositService _depositService;

        public DepositController()
        {
            // 初始化时使用接口类型
            IDepositRepository repository = new DepositRepository(db: new AppDbContext());
            _depositService = new DepositService(repository);
        }

        [HttpGet]
       
        public ActionResult DepositPoints()
        {
            return View();
        }

        [HttpPost]
        
        public ActionResult DepositPoints(DepositVm vm)
        {
            // 确保金额有效
            if (vm.DepositAmount == 0)
            {
                return Json(new { success = false, message = "儲值失敗：儲值金額無效。" });
            }

            try
            {
                var userId = GetCurrentUserId(); // 從票證中獲取當前用戶的 ID
                if (userId == 0)
                {
                    return Json(new { success = false, message = "無法獲取用戶ID，請重新登入。" });
                }

                var depositDto = new DepositDto
                {
                    MemberId = userId,
                    DepositAmount = vm.DepositAmount,
                    DepositDate = DateTime.Now
                };

                _depositService.DepositPoints(depositDto);

                return Json(new { success = true, message = $"成功儲值 {vm.DepositAmount} 點數！" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = $"儲值失敗：{ex.Message}" });
            }
        }
        private int GetCurrentUserId()
        {
            // 确保用户已经登录
            if (!User.Identity.IsAuthenticated)
            {
                throw new Exception("用户未登录");
            }

            // 解密身份票证，获取存储的用户 ID
            var authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            if (authCookie != null)
            {
                var ticket = FormsAuthentication.Decrypt(authCookie.Value);
                if (ticket != null)
                {
                    return int.Parse(ticket.UserData); // 票证中的 UserData 存储的是用户的 ID
                }
            }

            throw new Exception("无法获取用户ID，请重新登录。");
        }


        public ActionResult SomeAction()
        {
            try
            {
                int userId = GetCurrentUserId(); // 獲取當前用戶ID
                                                 // 使用 userId 做相關操作
            }
            catch (Exception ex)
            {
                // 處理獲取用戶ID失敗的情況
                return Json(new { success = false, message = ex.Message });
            }

            return View();
        }

        // 其他代碼
    }

}
