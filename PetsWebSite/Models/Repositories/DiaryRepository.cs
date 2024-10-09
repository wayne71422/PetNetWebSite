using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Drawing;
using System.Linq;
using System.Web;
using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Services;

namespace PetsWebSite.Models.Repositories
{
    public class DiaryRepository
    {
        private readonly AppDbContext _dbContext;

        public DiaryRepository()
        {
            _dbContext = new AppDbContext();
        }

        public IEnumerable<PetDiary> GetDiariesByPetId(int PetId)
        {
            var diaries = _dbContext.PetDiaries
                .AsNoTracking()
                .OrderByDescending(x => x.DataDate)
                .Where(p => p.PetId == PetId).ToList();

            //foreach (var diary in diaries)
            //{
            //    diary.Photos = GetPhotosByDiaryId(diary.Id);
            //}


            return diaries;
        }

        //public List<Photo> GetPhotosByDiaryId(int diaryId)
        //{
        //    //var photos = _dbContext.Photos
        //    //    .AsNoTracking()
        //    //    .Where(p => p.PetDiariesId == diaryId).ToList();

        //    var photoDtos = _dbContext.Database
        //        .SqlQuery<PhotoDto>("SELECT PetDiariesId, FIleName, UploadDate, FilePath FROM dbo.Photo WHERE PetDiariesId = {0}", diaryId)
        //        .ToList();
        //    var photos = new List<Photo>();    
        //    foreach (var photoDto in photoDtos)
        //    {
        //        var photo = MvcApplication._mapper.Map<Photo>(photoDto);
        //        photos.Add(photo);
        //    }

        //    return photos;
        //}
    
        public void AddDiary(PetDiary diary)
        {
            using (var context = new AppDbContext())
            {
                context.PetDiaries.Add(diary);
                context.SaveChanges();
            }
        }

        public int GetCurrnetDiaryId()
        {
            return _dbContext.PetDiaries.Max(d => d.Id);
        }

        public void AddPhotos(IEnumerable<Photo> photos)
        {
            try
            {
                using (var context = new AppDbContext())
                {
                    context.Photos.AddRange(photos);
                    context.SaveChanges();
                }
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        Console.WriteLine($"Property: {validationError.PropertyName}, Error: {validationError.ErrorMessage}");
                    }
                }
            }
            
        }
    }
}