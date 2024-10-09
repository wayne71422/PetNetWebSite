using PetWebBackSite.Models.Dtos;
using PetWebBackSite.Models.Infras;
using PetWebBackSite.Models.Services;
using PetWebBackSite.Models.ViewModels;
using System;
using System.Data.Entity.Validation;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace PetWebBackSite.Controllers
{
    public class ManagerController : Controller
    {
        private readonly ManagerService _managerService;

        // 依賴注入的方式傳遞 ManagerService
        public ManagerController(ManagerService managerService)
        {
            _managerService = managerService;
        }

        // GET: Manager/Register
        public ActionResult Register()
        {
            return View(new RegisterVm());
        }

        // POST: Manager/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterVm vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }

            try
            {
                // 檢查是否選擇了出生日期
                if (vm.BirthDate == default(DateTime))
                {
                    ModelState.AddModelError("BirthDate", "請選擇出生日期。");
                    return View(vm);
                }

                // 將 ViewModel 的值轉換為 DTO
                var dto = new RegisterDto
                {
                    Account = vm.Account,
                    Password = vm.Password,
                    Name = vm.Name,
                    PhoneNumber = vm.PhoneNumber,
                    DoctorBoolin = vm.DoctorBoolin,
                    Education = vm.Education,
                    Expertise = vm.Expertise,
                    Gender = vm.Gender,
                    Address = vm.Address,
                    BirthDate = vm.BirthDate.Date, // 確保只包含日期部分
                    PermissionLevel = vm.PermissionLevel
                };
               
                // 上傳圖片處理
                if (vm.ProfilePicture != null && vm.ProfilePicture.ContentLength > 0)
                {
                    string fileName = System.IO.Path.GetFileName(vm.ProfilePicture.FileName);
                    string path = System.IO.Path.Combine(Server.MapPath("~/Uploads/ProfilesPictures"), fileName);
                    vm.ProfilePicture.SaveAs(path);
                    dto.ProfilePicture = "/Uploads/ProfilesPictures/" + fileName;
                }

                // 調用服務層進行註冊處理
                _managerService.Register(dto);

                // 成功後跳轉
                return RedirectToAction("Login", "Manager");
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        ModelState.AddModelError(validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
                return View(vm);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "註冊失敗：" + ex.Message);
                return View(vm);
            }
        }





        // GET: Manager/Login
        [HttpGet]
        public ActionResult Login()
        {
            var model = new LoginVm();
            return View(model);
        }

        // POST: Manager/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginVm vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }

            var result = _managerService.ValidateLogin(new LoginDto
            {
                Account = vm.Account,
                Password = vm.Password
            });

            if (!result.IsSuccess)
            {
                ModelState.AddModelError(string.Empty, "帳號或密碼錯誤。");
                return View(vm);
            }

            // 登入成功，設置 FormsAuthentication
            var user = _managerService.GetByAccount(vm.Account);

            var ticket = new FormsAuthenticationTicket(
                1,
                user.Account,
                DateTime.Now,
                DateTime.Now.AddMinutes(30),
                false,
                user.Id.ToString(),
                FormsAuthentication.FormsCookiePath
            );

            string encryptedTicket = FormsAuthentication.Encrypt(ticket);
            var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
            Response.Cookies.Add(authCookie);

            // 設置 Session，儲存使用者資料
            Session["ProfilePicture"] = user.ProfilePicture;
            Session["MemberId"] = user.Id;
            Session["MemberName"] = user.Name;

            // 跳轉到首頁
            return RedirectToAction("ManagerIncomeDetails", "DoctorViews");
        }
        public ActionResult Logout()
        {
            // 清除 Forms 身份驗證票據
            FormsAuthentication.SignOut();  

            // 清除 Session
            Session.Clear();

            // 重定向到登入頁面
            return RedirectToAction("Login", "Manager");
        }
        // GET: Manager/Edit/5
        [Authorize]
        [HttpGet]
        public ActionResult EditProfile()
        {
            var user = _managerService.GetByAccount(User.Identity.Name);
            if (user == null)
            {
                return HttpNotFound();
            }

            var model = new EditUserVm
            {
                Id = user.Id,
                Account = user.Account,
                Name = user.Name,
                PhoneNumber = user.PhoneNumber,
                DoctorBoolin = user.DoctorBoolin,
                Education = user.Education,
                Expertise = user.Expertise,
                Gender = user.Gender,
                Address = user.Address,
                BirthDate = (DateTime)user.BirthDate,
                PermissionLevel = user.PermissionLevel
            };

            return View(model);


        }

		// POST: Manager/Edit/5
		//[Authorize]
		//[HttpPost]
		//[ValidateAntiForgeryToken]
		//public ActionResult EditProfile(EditUserVm vm)
		//{
		//    if (!ModelState.IsValid)
		//    {
		//        return View(vm);
		//    }

		//    try
		//    {
		//        var dto = vm.ToDto(); // Convert ViewModel to DTO for updating

		//        // Handle profile picture upload
		//        if (vm.ProfilePicture != null && vm.ProfilePicture.ContentLength > 0)
		//        {
		//            string fileName = System.IO.Path.GetFileName(vm.ProfilePicture.FileName);
		//            string path = System.IO.Path.Combine(Server.MapPath("~/Uploads/ProfilePictures"), fileName);
		//            vm.ProfilePicture.SaveAs(path);
		//            dto.ProfilePicture = "/Uploads/ProfilePictures/" + fileName;
		//        }

		//        _managerService.Update(dto);

		//        return RedirectToAction("Details", new { id = vm.Id });
		//    }
		//    catch (Exception ex)
		//    {
		//        ModelState.AddModelError("", "編輯失敗：" + ex.Message);
		//        return View(vm);
		//    }
		//}
		[Authorize]
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult EditProfile(EditUserVm vm)
		{
			if (!ModelState.IsValid)
			{
				return View(vm);
			}

			try
			{
				var dto = vm.ToDto(); // Convert ViewModel to DTO for updating
				if (vm.ProfilePicture.ContentLength > (4 * 1024 * 1024)) // 檔案大小限制 4MB
				{
					ModelState.AddModelError("", "上傳的檔案不能超過 4MB");
					return View(vm);
				}
				// Handle profile picture upload
				if (vm.ProfilePicture != null && vm.ProfilePicture.ContentLength > 0)
				{
					try
					{
						string fileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(vm.ProfilePicture.FileName);
						string directoryPath = Server.MapPath("~/Uploads/ProfilePictures");

						// Ensure the directory exists
						if (!System.IO.Directory.Exists(directoryPath))
						{
							System.IO.Directory.CreateDirectory(directoryPath);
						}

						string path = System.IO.Path.Combine(directoryPath, fileName);
						vm.ProfilePicture.SaveAs(path);  // Save the uploaded file
						dto.ProfilePicture = "/Uploads/ProfilePictures/" + fileName;  // Set the file path to the DTO
					}
					catch (Exception ex)
					{
						ModelState.AddModelError("", "上傳圖片失敗：" + ex.Message);
						return View(vm);
					}
				}

				_managerService.Update(dto);  // Perform the update in the service layer

				return RedirectToAction("EditProfile");
			}
			catch (Exception ex)
			{
				ModelState.AddModelError("", "編輯失敗：" + ex.Message);
				return View(vm);
			}
		}

	}
}
