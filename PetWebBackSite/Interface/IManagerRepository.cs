using PetWebBackSite.Models.Dtos;
using PetWebBackSite.Models.EFModels;

namespace PetWebBackSite.Interface
{
    public interface IManagerRepository
    {
        // 新增管理者
        void Create(ManagerProfile user);

        // 根據帳號取得管理者資料
        ManagerDto GetByAccount(string account);

        // 判斷帳號是否存在
        bool IsAccountExist(string account);

        // 更新管理者資料
        ManagerProfile GetById(int id);
        void Update(ManagerProfile user);



    }
}
