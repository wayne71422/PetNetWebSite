using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;

namespace PetsWebSite.Models.Repositories
{
    public class AlbumRepository
    {
        private readonly AppDbContext _dbContext;

        public AlbumRepository()
        {
            _dbContext = new AppDbContext();
        }

        public IEnumerable<AlbumDto> GetPhotosByMemberId(int memberId)
        {

            var fileNames = _dbContext.Database
                .SqlQuery<AlbumDto>(@"SELECT FileName
                            FROM dbo.Photo a
                            INNER JOIN dbo.PetDiaries b ON a.PetDiariesId = b.Id
                            INNER JOIN dbo.PetProfiles c ON b.PetId = c.Id
                            INNER JOIN dbo.Members d ON c.MemberId = d.Id
                            WHERE d.Id = {0}", memberId)
                .ToList();
            if (fileNames == null) return null;
            return fileNames;
        }
    }
}