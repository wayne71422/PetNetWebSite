using PetWebBackSite.Models.Dtos;
using PetWebBackSite.Models.Services;
using PetWebBackSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace PetWebBackSite.Controllers
{

    [Authorize]
    public class DoctorViewsController : Controller
    {
        private readonly DoctorViewsService _service;
        private  string Account;
        

        // GET: DoctorViews
        public DoctorViewsController()
        {
            _service = new DoctorViewsService();
            
        }

        
        public ActionResult BookingRecordList()
        {
            Account = User.Identity.Name;
            var dto = _service.GetBookingRecordsByAccount(Account);
            var vm = new List<CheckBookingRecrodVm>();
            foreach(var item in dto)
            { 
                var vmItem = new CheckBookingRecrodVm();
                vmItem = MvcApplication._mapper.Map<CheckBookingRecrodVm>(item);
                vm.Add(vmItem);
            } 
            return View(vm);
        }

        
        public ActionResult ManagerIncomeDetails()
        {
            Account = User.Identity.Name;
            var vm = new ManagerIncomeVm()
            {
                ManagerIncomeDetails = new List<ManagerIncomeDetailsVm>()
            };
            var dto = new ManagerIncomeDto();
            dto = _service.GetMangerInacomeDetails(Account,dto);
            foreach (var item in dto.ManagerIncomeDetails)
            {
                var vmItem = new ManagerIncomeDetailsVm();
                vmItem = MvcApplication._mapper.Map<ManagerIncomeDetailsVm>(item);
                ((List<ManagerIncomeDetailsVm>)vm.ManagerIncomeDetails).Add(vmItem);
            }
           
            return View(vm);
        }

        [HttpPost]
        public ActionResult ManagerIncomeDetails(ManagerIncomeVm vm)
        {
            Account = User.Identity.Name;
            var dto = MvcApplication._mapper.Map<ManagerIncomeDto>(vm);
            ManagerIncomeDto dtos = _service.GetMangerInacomeDetails(Account, dto);
            var vms = new ManagerIncomeVm
            {
                ManagerIncomeDetails = new List<ManagerIncomeDetailsVm>()
            };
            foreach (var item in dtos.ManagerIncomeDetails)
            {
                var vmItem = new ManagerIncomeDetailsVm();
                vmItem = MvcApplication._mapper.Map<ManagerIncomeDetailsVm>(item);
                ((List<ManagerIncomeDetailsVm>)vms.ManagerIncomeDetails).Add(vmItem);
            }
            return View(vms);
        }

        public ActionResult ChangeEndState(int id)
        {
            _service.ChangeEndState(id);
            return RedirectToAction("ManagerIncomeDetails");
        }
    }
}