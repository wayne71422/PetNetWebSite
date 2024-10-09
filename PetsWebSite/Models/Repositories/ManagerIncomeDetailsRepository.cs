using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Repositories
{
    public class ManagerIncomeDetailsRepository
    {
        private readonly AppDbContext _db;

        public ManagerIncomeDetailsRepository()
        {
            _db = new AppDbContext();
        }
        public Result CreateIncomeDetails(ManagerIncomeDetail income)
        {
            try
            {
                _db.ManagerIncomeDetails.Add(income);
                _db.SaveChanges();
                return Result.Success();
            } catch(Exception e)
            {
                return Result.Fail(e.Message);
            }
        }
    }
}