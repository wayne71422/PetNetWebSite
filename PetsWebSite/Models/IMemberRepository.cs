using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PetsWebSite.Models
{
    internal interface IMemberRepository
    {
        void Active(int memberId);
        //void Create(RegisterDto dto);
        void Create(Member member);

        MemberDto Get(int memberId);
        MemberDto Get(string email);
        bool IsAccountExist(string email);
        void Update(MemberDto memberInDb);
    }
}
