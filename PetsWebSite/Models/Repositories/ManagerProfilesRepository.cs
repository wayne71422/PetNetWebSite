using PetsWebSite.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Repositories
{
    public class ManagerProfilesRepository
    {
        private readonly AppDbContext _dbContext;

        public ManagerProfilesRepository()
        {
            _dbContext = new AppDbContext();
        }
        public IEnumerable<ManagerProfile> GetDoctors()
        {
            var doctor = _dbContext.ManagerProfiles
                .AsNoTracking()
                .Where(m => m.DoctorBoolin == "1").ToList();
            return doctor;
        }

        public ManagerProfile GetDoctor(int Id)
        {
            var doctor = _dbContext.ManagerProfiles
                .AsNoTracking()
                .FirstOrDefault(x=>x.Id == Id);
            return doctor;
        }
    }
}