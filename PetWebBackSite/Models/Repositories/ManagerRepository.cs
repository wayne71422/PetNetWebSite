using PetWebBackSite.Interface;
using PetWebBackSite.Models.Dtos;
using PetWebBackSite.Models.EFModels;
using System.Data.Entity.Validation;
using System;
using System.Linq;
using PetWebBackSite;

public class ManagerRepository : IManagerRepository
{
    private readonly AppDbContext _db;

    public ManagerRepository(AppDbContext db)
    {
        _db = db;
    }

    public void Create(ManagerProfile user)
    {
        try
        {
            _db.ManagerProfiles.Add(user);
            _db.SaveChanges();
        }
        catch (DbEntityValidationException ex)
        {
            foreach (var validationErrors in ex.EntityValidationErrors)
            {
                foreach (var validationError in validationErrors.ValidationErrors)
                {
                    Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                }
            }

            throw; // 重新拋出例外以便顯示錯誤訊息
        }
    }

    public bool IsAccountExist(string account)
    {
        return _db.ManagerProfiles.AsNoTracking().Any(x => x.Account == account);
    }

    public ManagerDto GetByAccount(string account)
    {
        var user = _db.ManagerProfiles.AsNoTracking()
                                      .FirstOrDefault(x => x.Account == account);
        var result = MvcApplication._mapper.Map<ManagerDto>(user);
        return result;
    }
    public ManagerProfile GetById(int id)
    {
        return _db.ManagerProfiles.Find(id); // 根據 ID 從資料庫中找到對應的 ManagerProfile
    }
    public void Update(ManagerProfile user)
    {
        var existingUser = _db.ManagerProfiles.Find(user.Id);
        if (existingUser != null)
        {
            existingUser.PermissionLevel = user.PermissionLevel;
            existingUser.ProfilePicture = user.ProfilePicture;
            existingUser.Account = user.Account;
            existingUser.Name = user.Name;
            existingUser.PhoneNumber = user.PhoneNumber;
            
            existingUser.Address = user.Address;
            existingUser.DoctorBoolin = user.DoctorBoolin;
            existingUser.Education = user.Education;
            existingUser.Expertise = user.Expertise;
            // 更新用戶資料
            _db.Entry(existingUser);
            _db.SaveChanges();
        }
    }


    private ManagerDto MapToManagerDto(ManagerProfile user)
    {
        if (user == null) return null;

        return new ManagerDto
        {
            Id = user.Id,
            PermissionLevel = user.PermissionLevel,
            ProfilePicture = user.ProfilePicture,
            Account = user.Account,
            Name = user.Name,
            PhoneNumber = user.PhoneNumber,
            Password = user.Password,
            Address = user.Address,
            DoctorBoolin = user.DoctorBoolin,
            Education = user.Education,
            Expertise = user.Expertise,
            Gender = user.Gender,            
        };        
    }
}
