using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Repositories
{
    public class BillDetailsRepository
    {
        private readonly AppDbContext _db;

        public BillDetailsRepository() 
        {
            _db = new AppDbContext();
        } 

        public Result CreateBillDetail(BillDetail billDetail)
        {
            try {
                _db.BillDetails.Add(billDetail);
                _db.SaveChanges();
            }catch (Exception e)
            {
                return Result.Fail(e.Message);
            }
            return Result.Success();
        }

        public BookRecord GetBookRecordById(int id)
        {
            return _db.BookRecords.FirstOrDefault(i => i.Id == id);
        }

        public BillDetail GetBillDetailByBookRecordId(int id)
        {
            return _db.BillDetails.FirstOrDefault(b => b.BookRecordId == id);
        }
    }
}