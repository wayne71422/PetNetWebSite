using PetWebBackSite.Interface;
using PetWebBackSite.Models.Dtos;
using PetWebBackSite.Models.EFModels;
using PetWebBackSite.Models.Infras;
using System;

public class ManagerService
{
    private readonly IManagerRepository _repo;

    public ManagerService(IManagerRepository repo)
    {
        _repo = repo;
    }

    // 註冊新管理者
    public void Register(RegisterDto dto)
    {
        if (_repo.IsAccountExist(dto.Account))
            throw new Exception("帳號已存在");

        // 為密碼進行加密處理
        string hashedPassword = HashUtility.ToSHA256(dto.Password);

        var user = new ManagerProfile
        {
            Account = dto.Account,
            Password = hashedPassword,
            FullName = dto.FullName,
            Name = dto.Name,
            PermissionLevel = dto.PermissionLevel,
            PhoneNumber = dto.PhoneNumber,
            DoctorBoolin = dto.DoctorBoolin,
            ProfilePicture = dto.ProfilePicture,
            Education = dto.Education,
            Expertise = dto.Expertise,
            Gender = dto.Gender,
            Address = dto.Address,
            BirthDate = dto.BirthDate,
        };

        _repo.Create(user);
    }

    public ManagerDto GetByAccount(string account)
    {
        return _repo.GetByAccount(account);
    }

    public Result ValidateLogin(LoginDto dto)
    {
        var user = _repo.GetByAccount(dto.Account);
        if (user == null)
            return Result.Fail("帳號或密碼錯誤");

        string hashedInputPassword = HashUtility.ToSHA256(dto.Password).ToLower();
        if (hashedInputPassword != user.Password.ToLower())
            return Result.Fail("帳號或密碼錯誤");

        return Result.Success();
    }

    public ManagerDto GetById(int id)
    {
        var profile = _repo.GetById(id); // 從資料庫取得 ManagerProfile

        // 檢查是否為空，並映射為 ManagerDto
        if (profile == null)
        {
            return null;
        }

        return new ManagerDto
        {
            Id = profile.Id,
            Account = profile.Account,
            FullName = profile.FullName,
            DoctorBoolin = profile.DoctorBoolin,
            Education = profile.Education,
            Expertise = profile.Expertise,
            Gender = profile.Gender,
            PhoneNumber = profile.PhoneNumber,
            BirthDate = profile.BirthDate,
            Address = profile.Address,
            ProfilePicture = profile.ProfilePicture,
            PermissionLevel = profile.PermissionLevel
        };
    }

    public void Update(ManagerDto dto)
    {
        var user = new ManagerProfile
        {
            Id = dto.Id,
            Account = dto.Account,
            FullName = dto.FullName,
            DoctorBoolin = dto.DoctorBoolin,
            Education = dto.Education,
            Expertise = dto.Expertise,
            Gender = dto.Gender,
            PhoneNumber = dto.PhoneNumber,
            BirthDate = dto.BirthDate,
            Password = dto.Password,
            Name = dto.Name,
            Address = dto.Address,
            ProfilePicture = dto.ProfilePicture,
            PermissionLevel = dto.PermissionLevel
        };

        _repo.Update(user); // 在 repository 中更新用戶資料
    }

    internal object GetById(int? id)
    {
        throw new NotImplementedException();
    }
}
