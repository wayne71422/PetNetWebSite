using AutoMapper;
using PetWebBackSite.Models.Dtos;
using PetWebBackSite.Models.EFModels;
using PetWebBackSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PetsWebSite.Models
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // 單向映射
            

            // 雙向映射
            CreateMap<CheckBookingRecrodVm, CheckBookingRecrodDto>().ReverseMap();
            CreateMap<IEnumerable<CheckBookingRecrodVm>, IEnumerable<CheckBookingRecrodDto>>().ReverseMap();
            CreateMap<IEnumerable<CheckBookingRecrodDto>, IEnumerable<BookRecord>>().ReverseMap();
            CreateMap<BookRecord, CheckBookingRecrodDto>().ReverseMap();
            CreateMap<ManagerIncomeDetailsVm, ManagerIncomeDetailsDto>().ReverseMap();
            CreateMap<ManagerIncomeDetail, ManagerIncomeDetailsDto>().ReverseMap();
            CreateMap<ManagerIncomeVm, ManagerIncomeDto>().ReverseMap();
            CreateMap<ManagerDto,ManagerProfile>().ReverseMap();
        }

    }
}