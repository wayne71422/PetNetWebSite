using PetsWebSite.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetsWebSite.Models.Interface
{
    public interface IDepositRepository
    {
        void CreateDepositRecord(DepositDto dto); // 新增儲值記錄
        decimal GetMemberBalance(int memberId);   // 取得會員餘額
        void UpdateMemberBalance(int memberId, decimal newBalance); // 更新會員餘額
    }

}
