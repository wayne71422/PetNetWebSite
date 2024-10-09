using PetsWebSite.Models.Services;
using PetsWebSite.Models.ViewModels;
using PetsWebSite.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Drawing;
using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.Repositories;
using System.IO;
using System.Runtime.Remoting.Metadata.W3cXsd2001;


namespace PetsWebSite.Controllers
{
    [Authorize]
    public class PetListController : Controller
    {
        private readonly PetService _petsService;
        

        public PetListController()
        {
            _petsService = new PetService();

            /*User.Identity.Name = "zhangsan@example.com";*///User.Identity.Name;
        }

        // GET: PetList
        public ActionResult PetList()
        {
            var pets = _petsService.GetPetsByMember(User.Identity.Name);
            var petList = new List<PetListVm>();
            foreach (var pet in pets)
            {
                var petListVm = new PetListVm();
                petListVm.Id = pet.Id;
                petListVm.Name = pet.Name;
                if (pet.Gender == "M")
                {
                    petListVm.Gender = "公";
                }
                else
                {
                    petListVm.Gender = "母";
                }
                petListVm.Birthday = pet.Birthday.HasValue ? pet.Birthday.Value.ToString("yyyy-MM-dd") : string.Empty;
                if (pet.Species == "C")
                {
                    petListVm.Species = "貓";
                }
                else if (pet.Species == "D")
                {
                    petListVm.Species = "狗";
                }
                petListVm.Breed = pet.Breed;
                if ((bool)pet.Neutered)
                {
                    petListVm.Neutered = "是";
                }
                else
                {
                    petListVm.Neutered = "否";
                }
                petListVm.Photo = pet.Photo;
                petListVm.Weight = pet.Weight.HasValue ? pet.Weight.Value : 0m;
                petList.Add(petListVm);
            }
            return View(petList);
        }

        [HttpGet]
        public ActionResult CreatePet()
        {
            var model = new PetCreateVm
            {
                SpeciesItems = GetSpeciesItems(),
                GenderItems = GetGenderItems(),
                BreedItems = new List<SelectListItem>(),
                NeuteredItems = GetNeuteredItems()
            };

            return View(model);
        }

        [HttpPost]
        public ActionResult CreatePet(PetCreateVm model, HttpPostedFileBase Photo)
        {

            if (ModelState.IsValid)
            {
                string path = Server.MapPath("/Uploads/Pets");
                string newFileName = SaveFile(Photo, path);


                // 使用服務來保存新寵物資料
                var pet = new PetListDto
                {
                    Name = model.Name,
                    Gender = model.GenderId,
                    Birthday = model.Birthday,
                    Species = model.SpeciesId,
                    Breed = model.BreedId,
                    Weight = (decimal)model.Weight,
                    Neutered = model.NeuteredId == "Y",
                    Photo = newFileName,
                };

                _petsService.AddPet(pet, User.Identity.Name); // 寫入資料庫

                // 重定向到寵物列表
                return RedirectToAction("PetList");
            }
            else
            {
                model.BreedItems = new List<SelectListItem>();
                model.SpeciesItems = GetSpeciesItems();
                model.NeuteredItems = GetNeuteredItems();
                model.GenderItems = GetGenderItems();
            }

            // 若模型無效，返回原來的創建視圖
            return View(model);
        }

        private IEnumerable<SelectListItem> GetSpeciesItems()
        {
            return new List<SelectListItem>
            {
                new SelectListItem { Value = "C", Text = "貓" },
                new SelectListItem { Value = "D", Text = "狗" }
            };

        }

        private IEnumerable<SelectListItem> GetGenderItems()
        {
            return new List<SelectListItem>
            {
                new SelectListItem { Value = "M", Text = "公" },
                new SelectListItem { Value = "F", Text = "母" }
            };
        }

        private IEnumerable<SelectListItem> GetNeuteredItems()
        {
            return new List<SelectListItem>
            {
                new SelectListItem { Value = "Y", Text = "是" },
                new SelectListItem { Value = "N", Text = "否" }
            };
        }

        private IEnumerable<SelectListItem> GetBreedItems(string breeadVal)
        {
            return new List<SelectListItem>
            {
                new SelectListItem { Value = breeadVal, Text = breeadVal }
            };
        }

        private string SaveFile(HttpPostedFileBase file, string path)
        {
            if (file == null || file.ContentLength == 0) return null;
            string ext = Path.GetExtension(file.FileName);
            string newFileName = Guid.NewGuid().ToString("N") + ext;
            string fullPath = Path.Combine(path, newFileName);
            file.SaveAs(fullPath);
            return newFileName;
        }


        public ActionResult EditPet(int petId)
        {
            var pet = _petsService.GetPetsByPetId(petId);
            var model = new PetEditVm
            {
                Id = petId,
                Name = pet.Name,
                Birthday = pet.Birthday.HasValue ? pet.Birthday.Value.ToString("yyyy-MM-dd") : string.Empty,
                SpeciesId = pet.Species,
                SpeciesItems = GetSpeciesItems(),
                GenderId = pet.Gender,
                GenderItems = GetGenderItems(),
                BreedId = pet.Breed,
                BreedItems = GetBreedItems(pet.Breed),
                NeuteredId = (bool)pet.Neutered ? "Y" : "N",
                NeuteredItems = GetNeuteredItems(),
                Weight = pet.Weight,
                Photo = pet.Photo
            };

            return View(model);
        }

        [HttpPost]
        public ActionResult EditPet(PetEditVm model, HttpPostedFileBase Photo)
        {

            if (ModelState.IsValid)
            {
                string newFileName = string.Empty;

                if (Photo != null)
                {
                    string path = Server.MapPath("/Uploads/Pets");
                    newFileName = SaveFile(Photo, path);
                }

                var pet = new PetListDto
                {
                    Id = model.Id,
                    Name = model.Name,
                    Gender = model.GenderId,
                    Birthday = DateTime.ParseExact(model.Birthday, "yyyy-MM-dd", null),
                    Species = model.SpeciesId,
                    Breed = model.BreedId,
                    Weight = (decimal)model.Weight,
                    Neutered = model.NeuteredId == "Y",
                    Photo = newFileName,
                };

                _petsService.UpdatePet(pet);

                return RedirectToAction("PetList");
            }
            else
            {
                model.BreedItems = new List<SelectListItem>();
                model.SpeciesItems = GetSpeciesItems();
                model.NeuteredItems = GetNeuteredItems();
                model.GenderItems = GetGenderItems();
            }

            return View(model);
        }

        public ActionResult Diary(int petId)
        {
            var diaryDic = BuildDiaryDic(petId);
            string name = _petsService.GetPetsByPetId(petId).Name;

            var model = new DiaryVm
            {
                Name = name,
                PetId = petId,
                Diaries = diaryDic,
                TitleItems = GetTitleItems()
            };
            return View(model);
        }

        private IEnumerable<SelectListItem> GetTitleItems()
        {
            return new List<SelectListItem>
            {
                new SelectListItem { Value = "dailyRecord", Text = "日常記錄" },
                new SelectListItem { Value = "docRecord", Text = "就醫記錄" },
                new SelectListItem { Value = "medRecord", Text = "用藥記錄" },
                new SelectListItem { Value = "wgtRecord", Text = "體重記錄" },
                new SelectListItem { Value = "others", Text = "其他" },
            };

        }

        [HttpPost]
        public ActionResult Diary(DiaryVm model, IEnumerable<HttpPostedFileBase> UploadPhotos)
        {
            if (ModelState.IsValid)
            {
                
                //int nextDiaryId = currentDiaryId++;
                var diaryDto = new DiaryDto
                {
                    PetId = model.PetId,
                    Title = model.Title,
                    Content = model.Content,
                    DataDate = model.DataDate
                };

                if (model.Weight != null)
                {
                    diaryDto.Weight = (decimal)model.Weight;
                }

                _petsService.AddDiary(diaryDto);

                int currentDiaryId = _petsService.GetCurrentDiaryId();
                string path = Server.MapPath("/Uploads/Diaries");
                var photoDtos = new List<PhotoDto>();
                foreach (HttpPostedFileBase uploadPhoto in UploadPhotos)
                {
                    string newFileName = SaveFile(uploadPhoto, path);

                    var photoDto = new PhotoDto
                    {
                        PetDiariesId = currentDiaryId,
                        FileName = newFileName,
                        UploadDate = model.DataDate,
                        FilePath = Path.Combine(path, newFileName),
                    };
                    photoDtos.Add(photoDto);
                }
                _petsService.AddPhotos(photoDtos);

                return RedirectToAction("Diary", new { petId=model.PetId});
            }
            else
            {
                model.Diaries = BuildDiaryDic(model.PetId);
                model.TitleItems = GetTitleItems();
            }

            // 若模型無效，返回原來的創建視圖
            return View(model);
            
        }

        private Dictionary<int, Dictionary<int, List<DiaryDto>>> BuildDiaryDic(int petId)
        {
            var diaries = _petsService.GetDiariesByPetId(petId);
            var diaryDic = new Dictionary<int, Dictionary<int, List<DiaryDto>>>();

            foreach (var diary in diaries)
            {
                int year = ((DateTime)diary.DataDate).Year;
                int month = ((DateTime)diary.DataDate).Month;

                if (diaryDic.ContainsKey(year))
                {
                    if (diaryDic[year].ContainsKey(month))
                    {
                        diaryDic[year][month].Add(diary);
                    }
                    else
                    {
                        diaryDic[year].Add(month, new List<DiaryDto> { diary });
                    }
                }
                else
                {
                    diaryDic.Add(year, new Dictionary<int, List<DiaryDto>>
                    {
                        { month, new List<DiaryDto> { diary } }
                    });
                }

            }

            return diaryDic;
        }
    }
}