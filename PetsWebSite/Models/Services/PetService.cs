using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Services
{
    public class PetService
    {
        private readonly MembersRepository _MemberRepo;
        private readonly PetProfilesRepository _PetProfilesRepo;
        private readonly DiaryRepository _DiaryRepo;
        private readonly AlbumRepository _AlbumRepo;
        private readonly Dictionary<string, string> TITLE_MAPPING = new Dictionary<string, string>
        {
            { "dailyRecord", "日常記錄" },
            { "docRecord", "就醫記錄" },
            { "medRecord", "用藥記錄" },
            { "wgtRecord", "體重記錄"},
            { "others", "其他" }
        };
        public PetService()
        {
            _MemberRepo = new MembersRepository();
            _PetProfilesRepo = new PetProfilesRepository();
            _DiaryRepo = new DiaryRepository();
            _AlbumRepo = new AlbumRepository();
        }
        internal void AddPet(PetListDto pet, string account)
        {

            var pets = MvcApplication._mapper.Map<PetProfile>(pet);
            pets.MemberId = _MemberRepo.GetMemberByAccount(account).Id;
            //if (pet.IsNeutered == "Y") pets.Neutered = true;
            //else pets.Neutered = false;
            _PetProfilesRepo.Create(pets);
        }

        public IEnumerable<PetProfile> GetPetsByMember(string account)
        {
            if (account == null) throw new Exception("帳號為空，尚未登入，請重新登入");

            var member = _PetProfilesRepo.GetMemberByAccount(account);
            if (member == null) throw new Exception("帳號尚未開通，請開通後再登錄");

            var pets = _PetProfilesRepo.GetPetsByMemberId(member.Id);
            if (pets == null) throw new Exception("親，您沒有寵物喔!請新增寵物後再進行預約");

            return pets;
        }

        public PetProfile GetPetsByPetId(int petId)
        {
            var pet = _PetProfilesRepo.GetPetByPetId(petId);

            return pet;
        }

        public void UpdatePet(PetListDto pet)
        {
            _PetProfilesRepo.UpdatePet(pet);
        }

        public List<DiaryDto> GetDiariesByPetId(int petId)
        {
            var diaries = _DiaryRepo.GetDiariesByPetId(petId).ToList();
            //string name = _PetProfilesRepo.GetPetByPetId(petId).Name;
            var diaryDtos = new List<DiaryDto>();
            foreach (var diary in diaries) 
            {
                var daryDto = new DiaryDto
                {
                    PetId = diary.PetId,
                    Type = diary.Type,
                    Content = diary.Content,
                    Title = TITLE_MAPPING.ContainsKey(diary.Title) ? TITLE_MAPPING[diary.Title] : diary.Title,
                    Weight = (decimal)diary.Weight,
                    DataDate = (DateTime)diary.DataDate,
                    Photos = diary.Photos
                };
                diaryDtos.Add(daryDto);
            }
            return diaryDtos;
        }

        public void AddDiary(DiaryDto diaryDto)
        {
            var diary = MvcApplication._mapper.Map<PetDiary>(diaryDto);
            diary.CreateDate = DateTime.Now;
            _DiaryRepo.AddDiary(diary);
        }

        public int GetCurrentDiaryId()
        {
            return _DiaryRepo.GetCurrnetDiaryId();
        }

        public void AddPhotos (IEnumerable<PhotoDto> photoDtos)
        {
            var photos = new List<Photo>();
            foreach(var photoDto in photoDtos)
            {
                var photo = MvcApplication._mapper.Map<Photo>(photoDto);
                photos.Add(photo);
            }
            _DiaryRepo.AddPhotos(photos);
        }

        public IEnumerable<AlbumDto> GetPhotosByMember(string account)
        {
            if (account == null) throw new Exception("帳號為空，尚未登入，請重新登入");

            var member = _PetProfilesRepo.GetMemberByAccount(account);
            if (member == null) throw new Exception("帳號尚未開通，請開通後再登錄");

            var photos = _AlbumRepo.GetPhotosByMemberId(member.Id);
            if (photos == null) throw new Exception("親，您沒有寵物喔!");

            return photos;
        }
    }
}