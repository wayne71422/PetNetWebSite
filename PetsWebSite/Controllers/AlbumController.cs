using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.Services;
using PetsWebSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PetsWebSite.Controllers
{
    public class AlbumController : Controller
    {
        private readonly PetService _petsService;
        

        public AlbumController()
        {
            _petsService = new PetService();

            //User.Identity.Name = "zhangsan@example.com";//User.Identity.Name;
        }

        // GET: Album
        public ActionResult Album()
        {
            var photos = _petsService.GetPhotosByMember(User.Identity.Name);
            var fileNameList = CheckPhotos(photos);

            var model = new List<AlbumVm>();
            foreach (var fileName in fileNameList)
            {
                var albumVm = new AlbumVm
                {
                    PhotoName = fileName
                };
                model.Add(albumVm);
            }
            
            return View(model);
        }

        private List<string> CheckPhotos(IEnumerable<AlbumDto> photos)
        {
            var fileNameList = new List<string>();
            var fileToRemove = new List<string>();
            
            foreach (var photo in photos)
            {
                fileNameList.Add(photo.FileName);
            }
            foreach (var fileName in fileNameList)
            {
                string fileDir = Server.MapPath("/Uploads/Diaries");
                string filePath = Path.Combine(fileDir, fileName);
                if (!System.IO.File.Exists(filePath))
                {
                    fileToRemove.Add(fileName);
                }
            }
            foreach (var file in fileToRemove)
            {
                fileNameList.Remove(file);
            }

            return fileNameList;
        }
    }
}