using PetsWebSite.Models.Dtos;
using PetsWebSite.Models.EFModels;
using PetsWebSite.Models.Services;
using PetsWebSite.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace PetsWebSite.Models.Repositories
{
    public class PetProfilesRepository
    {
        private readonly AppDbContext _dbContext;

        public PetProfilesRepository()
        {
            _dbContext = new AppDbContext();
        }
        
        public PetProfile GetPetByPetId(int petId)
        {
            var petProfile = _dbContext.PetProfiles
                .AsNoTracking()
                .FirstOrDefault(p=>p.Id == petId);
            return petProfile;
        }

		// API-specific method to return serialized data (if needed)
		public List<PetProfile> GetPetsForApi(int memberId)
		{
			var pets = _dbContext.PetProfiles
				.AsNoTracking()
				.Where(p => p.MemberId == memberId)
				.ToList();

			return pets;
		}

        public void Create(PetProfile petProfile)
        {
            using (var context = new AppDbContext())
            {
                context.PetProfiles.Add(petProfile);
                context.SaveChanges();
            } 
        }

        public Member GetMemberByAccount(string account)
        {
            var member = _dbContext.Members
                .AsNoTracking()
                .FirstOrDefault(m => m.Email == account);
            return member;
        }

        public IEnumerable<PetProfile> GetPetsByMemberId(int memberId)
        {
            
            var petResult = _dbContext.PetProfiles
                .AsNoTracking()
                .Where(p => p.MemberId == memberId).ToList();
            if (petResult == null) return null;
            return petResult;
        }

        public Result UpdatePet(PetListDto dto)
        {
            var updatePet = _dbContext.PetProfiles
                .FirstOrDefault(b => b.Id == dto.Id);

            updatePet.Name = dto.Name;
            updatePet.Birthday = dto.Birthday;
            updatePet.Gender = dto.Gender;
            updatePet.Neutered = dto.Neutered;
            updatePet.Breed = dto.Breed;
            updatePet.Species = dto.Species;
            updatePet.Weight = dto.Weight;
            if (!string.IsNullOrWhiteSpace(dto.Photo)) updatePet.Photo = dto.Photo;

            _dbContext.SaveChanges();

            return Result.Success();
        }
    }
}