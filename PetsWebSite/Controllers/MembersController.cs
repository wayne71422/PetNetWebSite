using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;

using PetsWebSite.Models.Repositories;

using PetsWebSite.Models.Infra;

using PetsWebSite.Models.Services;
using PetsWebSite.Models.ViewModels;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

using System.Web.Services.Description;

using System.Web.UI.WebControls;

namespace PetsWebSite.Controllers
{
    
    public class MembersController : Controller
    {
        private readonly MemberService _memberService;

        public MembersController()
        {
            _memberService = new MemberService(); // 初始化 MemberService
           
        }
        // GET: Members
        public ActionResult BookPage()
        {

            return View();
        }
        private int GetCurrentUserId()
        {
            var authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
            if (authCookie != null)
            {
                var ticket = FormsAuthentication.Decrypt(authCookie.Value);
                if (ticket != null && !string.IsNullOrEmpty(ticket.UserData))
                {
                    return int.Parse(ticket.UserData); // 確保 `UserData` 不為 null 或空
                }
                else
                {
                    throw new Exception("票證無效或缺少用戶數據");
                }
            }
            throw new Exception("用戶未登錄或票證無效");
        }


        public ActionResult Register()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterVm vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm); // 如果表單驗證失敗，回傳表單
            }

            // 檢查表單資料
            Console.WriteLine($"Received form data: {vm.Email}, {vm.Name}");

            var dto = vm.ToDto(); // 將 ViewModel 轉換成 Dto
            var service = new MemberService();

            try
            {
                service.Register(dto); // 調用註冊方法
                return RedirectToAction("verifyEmail"); // 成功後跳轉到確認頁面
            }
            catch (Exception ex)
            {
                // 記錄例外，並顯示錯誤訊息
                ModelState.AddModelError("", "註冊失敗：" + ex.Message);
                return View(vm);
            }
        }


        public ActionResult ActiveRegister(int memberId, string confirmCode)
        {
            Result result = HandleActiveRegister(memberId, confirmCode);
            if (!result.IsSuccess)
            {
                ModelState.AddModelError(string.Empty, result.ErrorMessage);
                return View();
            }
            return View();
        }


        private Result HandleActiveRegister(int memberId, string confirmCode)
        {
            try
            {
                var service = new MemberService();
                service.ActiveRegister(memberId, confirmCode);
                return Result.Success();
            }
            catch (Exception ex)
            {
                return Result.Fail(ex.Message);
            }
        }


        private Result HandleRegister(RegisterVm vm)
        {
            //在這裡,可以自行決定要叫用EF or Service object進行 create member的工作
            MemberService service = new MemberService();
            try
            {
                RegisterDto dto = vm.ToDto();
                service.Register(dto);

                return Result.Success();
            }
            catch (Exception ex)
            {
                return Result.Fail(ex.Message);
            }
        }


        [HttpGet]
        public ActionResult Login()
        {
            var model = new LoginVm();
            var emailCookie = Request.Cookies["RememberMeEmail"];
            var passwordCookie = Request.Cookies["RememberMePassword"];

            if (emailCookie != null && passwordCookie != null)
            {
                // 將 Cookie 的值填充到模型中
                model.Email = emailCookie.Value;
                model.Password = passwordCookie.Value;
            }
            
            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginVm vm)
        {
            if (ModelState.IsValid)
            {
                // 調用 HandleLogin 進行資料庫驗證

                //Result result = HandleLogin(vm);
                Result result = _memberService.ValidateLogin(new LoginDto
                {
                    Email = vm.Email,
                    Password = vm.Password
                });

                if (result.IsSuccess)
                {
                    // 設置 FormsAuthentication
                    FormsAuthentication.SetAuthCookie(vm.Email, vm.RememberMe);
                    var member = _memberService.GetMemberByEmail(vm.Email);

                    var ticket = new FormsAuthenticationTicket(
                        1,                                   // 版本号
                        member.Email,                        // 用戶名（這會保存在 User.Identity.Name 中）
                        DateTime.Now,                        // 創建時間
                        DateTime.Now.AddMinutes(30),         // 到期時間
                        vm.RememberMe,                       // 是否持久化
                        member.Id.ToString(),                // UserData 中存儲的是用戶 ID
                        FormsAuthentication.FormsCookiePath  // Cookie 路徑
                    );

                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                    var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    Response.Cookies.Add(authCookie);

                    // 存储其他用户信息到 Session
                    Session["MemberId"] = member.Id;
                    Session["MemberName"] = member.Name;
                    if (vm.RememberMe)
                    {
                        HttpCookie emailCookie = new HttpCookie("RememberMeEmail", vm.Email);
                        HttpCookie passwordCookie = new HttpCookie("RememberMePassword", vm.Password); // 注意安全性問題

                        emailCookie.Expires = DateTime.Now.AddDays(30); // 設置過期時間
                        passwordCookie.Expires = DateTime.Now.AddDays(30);

                        Response.Cookies.Add(emailCookie);
                        Response.Cookies.Add(passwordCookie);
                    }
                    
                    return RedirectToAction("BookPage", "Members"); // 登入成功，跳轉至首頁
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "帳號或密碼錯誤。");
                }                

                return View(vm);
            }
            return View(vm);
        }
        private (string url, HttpCookie cookie) ProcessLogin(string email)
        {
            var roles = string.Empty;//在本範例,沒有用到角色全縣,所以存入空白
                                     //建立一張認證票
            var ticket =
                new FormsAuthenticationTicket(
                    1,
                    email,
                    DateTime.Now,
                    DateTime.Now.AddDays(2),
                    false,
                    roles,
                    "/"
                    );
            var value = FormsAuthentication.Encrypt(ticket);

            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, value);

            var url = FormsAuthentication.GetRedirectUrl(email, true);
            return (url, cookie);
        }
        private Result HandleLogin(LoginVm vm)
        {
            try
            {
                var service = new MemberService();

                // 使用 AutoMapper 將 ViewModel 轉換為 DTO
                LoginDto dto = MvcApplication._mapper.Map<LoginDto>(vm);

                // 使用 Service 驗證會員的登入資訊
                Result validateResult = service.ValidateLogin(dto);
                if (validateResult.IsSuccess)
                {
                    // 驗證成功後取得會員資料，將會員名稱儲存到 Session
                    var member = service.GetMemberByEmail(vm.Email);
                    Session["MemberName"] = member.Name; // 將會員名稱存入 Session

                }

                return validateResult;
            }
            catch (Exception ex)
            {
                return Result.Fail(ex.Message);
            }
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ForgotPassword(ForgotPasswordVm vm)
        {
            if (ModelState.IsValid == false) return View(vm);
            var urlTemplate = Request.Url.Scheme + "://" +//生成http:.//或https://
                Request.Url.Authority + "/" +//生成網域名稱或ip
                "Members/ResetPassword?memberid={0}&confirmCode={1}";//生成網頁url
            var result = ProcessResetPassword(vm.Email, urlTemplate);

            if (result.IsSuccess == false)
            {
                ModelState.AddModelError(string.Empty, result.ErrorMessage);
                return View(vm);
            }
            return View("verifyEmail");
        }

        [HttpGet]
        public ActionResult ResetPassword(int memberId, string confirmCode)
        {
            // 檢查是否有接收到 memberId 和 confirmCode
            if (memberId == 0 || string.IsNullOrEmpty(confirmCode))
            {
                return RedirectToAction("Login"); // 如果缺少必要參數，導向錯誤頁面
            }

            // 查詢會員是否存在
            var db = new AppDbContext();
            var member = db.Members
                .FirstOrDefault(m => m.Id == memberId && m.ConfirmCode.ToLower() == confirmCode.ToLower());

            if (member == null)
            {
                return RedirectToAction("Login"); // 如果找不到對應的會員或確認碼無效
            }

            if (member.ConfirmCode.Trim().ToLower() != confirmCode.Trim().ToLower())
            {
                return RedirectToAction("Login"); // 如果確認碼無效
            }
            // 準備視圖模型並回傳
            var model = new ResetPasswordVm
            {
                MemberId = memberId,
                ConfirmCode = confirmCode
            };

            return View(model); // 顯示重設密碼表單
        }

        [HttpPost]
        public ActionResult ResetPassword(ResetPasswordVm vm)
        {
            // 確保模型驗證通過
            if (!ModelState.IsValid)
            {
                return View(vm); // 返回表單並顯示錯誤
            }

            // 驗證 memberId 和 confirmCode
            var db = new AppDbContext();
            var member = db.Members.FirstOrDefault(m => m.Id == vm.MemberId && m.ConfirmCode.ToLower() == vm.ConfirmCode.ToLower());

            if (member == null)
            {
                ModelState.AddModelError("", "無效的確認碼或會員 ID");
                return View(vm);
            }

            // 處理密碼重設
            Result result = ProcessChangePassword(vm.MemberId, vm.ConfirmCode, vm.NewPassword);
            if (!result.IsSuccess)
            {
                ModelState.AddModelError("", result.ErrorMessage);
                return View(vm);
            }

            return RedirectToAction("Login"); // 重設密碼成功後跳轉到登入頁面
        }

        private Result ProcessResetPassword(string email, string urlTemplate)
        {
            var db = new AppDbContext();

            // 檢查account,email正確性
            var memberInDb = db.Members.FirstOrDefault(m => m.Email == email);
            if (memberInDb == null) return Result.Fail("Email錯誤"); // 故意不告知確切錯誤原因

            // 檢查是否已啟用帳號
            if (memberInDb.IsConfirmed == false)
            {
                return Result.Fail("您還沒有啟用本帳號，請先完成帳號啟用");
            }

            // 更新確認碼
            var confirmCode = Guid.NewGuid().ToString("N"); // 使用 "N" 生成沒有分隔符的 GUID
            memberInDb.ConfirmCode = confirmCode;

            try
            {
                // 保存到資料庫
                db.SaveChanges();

                // Debug: 輸出已生成的 confirmCode
                Console.WriteLine($"Generated confirmCode: {confirmCode}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Failed to update confirmCode: {ex.Message}");
                return Result.Fail("無法更新確認碼，請稍後再試");
            }

            // 發送重設密碼郵件
            var url = string.Format(urlTemplate, memberInDb.Id, confirmCode); // 確認 URL 是否格式正確
            new EmailHelper().SendForgotPasswordEmail(url, memberInDb.Name, email);

            return Result.Success();
        }
        private Result ProcessChangePassword(int memberId, string confirmCode, string password)
        {
            var db = new AppDbContext();
            //驗證memberId,confirmCode是否正確
            var memberInDb = db.Members.FirstOrDefault(m => m.Id == memberId && m.ConfirmCode == confirmCode);
            if (memberInDb == null)
            {
                return Result.Fail("無效的確認碼或會員 ID");
            }
            //更新密碼,並將 confirmCode清空

            var hasPassword = HashUtility.ToSHA256(password);
            memberInDb.Password = hasPassword;

            //memberInDb.EncryptedPassword = encryptedPassword;
            memberInDb.ConfirmCode = null;

            db.SaveChanges();
            return Result.Success();
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();

            // 保留 Email 和 Password 的 Cookie，不清除
            if (Request.Cookies["RememberMeEmail"] != null && Request.Cookies["RememberMePassword"] != null)
            {
                HttpCookie emailCookie = Request.Cookies["RememberMeEmail"];
                HttpCookie passwordCookie = Request.Cookies["RememberMePassword"];

                emailCookie.Expires = DateTime.Now.AddDays(30); // 保留 30 天
                passwordCookie.Expires = DateTime.Now.AddDays(30); // 保留 30 天

                Response.Cookies.Set(emailCookie);
                Response.Cookies.Set(passwordCookie);
            }

            return RedirectToAction("Login", "Members");
        }
        public ActionResult VerifyEmail()
        {
            return View(); // 返回對應的視圖
        }
        public ActionResult VerifySuccess()
        {
            return View(); // 返回對應的視圖
        }
        public ActionResult VerifyFailed()
        {
            return View(); // 返回對應的視圖
        }
        public ActionResult VerifyEmailSucOrFail(int memberId, string confirmCode)
        {
            var service = new MemberService();

            try
            {
                service.ActiveRegister(memberId, confirmCode); // 啟用帳號
                ViewBag.Message = "您的帳號已成功驗證！";
                return View("VerifySuccess");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View("VerifyFailed");
            }
        }
        [Authorize]
        public ActionResult EditProfile()
        {
            var account = User.Identity.Name;   
            MemberDto dto = new MemberRepository().Get(account);

            if (dto == null)
            {
                return RedirectToAction("ErrorPage");
            }

            EditProfileVm vm = MvcApplication._mapper.Map<EditProfileVm>(dto);
            return View(vm);
        }

        [Authorize]
        [HttpPost]
        public ActionResult EditProfile(EditProfileVm vm)
        {
            string account = User.Identity.Name;
            Result result = HandleUpdateProfile(account, vm);

            if (result.IsSuccess)
            {
                TempData["SuccessMessage"] = "個人資料已成功更新！";
                return RedirectToAction("EditProfile"); // 重定向到同一個頁面來防止表單重新提交
            }
            TempData["ErrorMessage"] = "更新個人資料時發生錯誤：" + result.ErrorMessage;

            return View(vm);
        }
        private Result HandleUpdateProfile(string account, EditProfileVm vm)
        {
            var service = new MemberService();
                


            //try
            //{
            EditProfileDto dto = MvcApplication._mapper.Map<EditProfileDto>(vm);
            Result result = service.UpdateProfile(account, dto);

            return result;
            //}
            //catch (Exception ex) 
            //{
            //return Result.Fail(ex.Message);
            //}

        }   

    }
}