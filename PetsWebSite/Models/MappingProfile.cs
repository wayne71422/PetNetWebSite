using AutoMapper;
using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.ViewModels;
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
            //CreateMap<LoginVm, LoginDto>();
            //CreateMap<MemberDto, EditProfileVm>();
            //CreateMap<EditProfileVm, EditProfileDto>();
            //CreateMap<ChangePasswordVm, ChangePasswordDto>();

            // 雙向映射
            CreateMap<BookDateVm, BookDateDto>().ReverseMap();
            CreateMap<BookDateDto, BookRecord>().ReverseMap();
            CreateMap<BookDateRecordVm, BookDateRecordDto>().ReverseMap();
            CreateMap<LoginVm, LoginDto>();
            CreateMap<Member, MemberDto>().ReverseMap();
            CreateMap<MemberDto, EditProfileVm>();
            CreateMap<EditProfileVm, EditProfileDto>();
            CreateMap<ChangePasswordVm, ChangePasswordDto>();
            CreateMap<PetListVm, PetProfile>().ReverseMap();
            CreateMap<PetListDto, PetProfile>().ReverseMap();
            CreateMap<DiaryDto, PetDiary>().ReverseMap();
            CreateMap<PhotoDto, Photo>().ReverseMap();

        }

    }
}