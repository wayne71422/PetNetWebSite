using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.Interface;
using PetsWebSite.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Services
{
    public class DepositService
    {
        private readonly IDepositRepository _repo;
        

        public DepositService(IDepositRepository repo)
        {
            _repo = repo ?? throw new ArgumentNullException(nameof(repo)); // 如果 repo 为 null，抛出异常
        }

            

        public void DepositPoints(DepositDto dto)
        {
            // 新增儲值記錄
            _repo.CreateDepositRecord(dto);

            // 更新會員餘額
            var currentBalance = _repo.GetMemberBalance(dto.MemberId);
            var newBalance = currentBalance + dto.DepositAmount;
            _repo.UpdateMemberBalance(dto.MemberId, newBalance);
        }
        
    }
}