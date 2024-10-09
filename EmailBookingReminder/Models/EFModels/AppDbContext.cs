using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace EmailBookingReminder.Models.EFModels
{
    public partial class AppDbContext : DbContext
    {
        public AppDbContext()
            : base("name=AppDbContext")
        {
        }

        public virtual DbSet<BillDetail> BillDetails { get; set; }
        public virtual DbSet<BookRecord> BookRecords { get; set; }
        public virtual DbSet<BookTime> BookTimes { get; set; }
        public virtual DbSet<DepositRecord> DepositRecords { get; set; }
        public virtual DbSet<ManagerIncomeDetail> ManagerIncomeDetails { get; set; }
        public virtual DbSet<ManagerProfile> ManagerProfiles { get; set; }
        public virtual DbSet<Member> Members { get; set; }
        public virtual DbSet<PetDiary> PetDiaries { get; set; }
        public virtual DbSet<PetProfile> PetProfiles { get; set; }
        public virtual DbSet<PetsTag> PetsTags { get; set; }
        public virtual DbSet<Photo> Photos { get; set; }
        public virtual DbSet<PictureFile> PictureFiles { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BillDetail>()
                .Property(e => e.Amount)
                .HasPrecision(10, 2);

            modelBuilder.Entity<BillDetail>()
                .HasMany(e => e.ManagerIncomeDetails)
                .WithRequired(e => e.BillDetail)
                .HasForeignKey(e => e.BillDetailsId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BookTime>()
                .Property(e => e.BookTime1)
                .IsUnicode(false);

            modelBuilder.Entity<BookTime>()
                .HasMany(e => e.BookRecords)
                .WithRequired(e => e.BookTime1)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DepositRecord>()
                .Property(e => e.DepositAmount)
                .HasPrecision(10, 2);

            modelBuilder.Entity<ManagerProfile>()
                .Property(e => e.Account)
                .IsUnicode(false);

            modelBuilder.Entity<ManagerProfile>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<ManagerProfile>()
                .Property(e => e.DoctorBoolin)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ManagerProfile>()
                .Property(e => e.Gender)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ManagerProfile>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<ManagerProfile>()
                .Property(e => e.LineCode)
                .IsFixedLength();

            modelBuilder.Entity<Member>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<Member>()
                .Property(e => e.AccountBalance)
                .HasPrecision(10, 2);

            modelBuilder.Entity<Member>()
                .Property(e => e.ConfirmCode)
                .IsUnicode(false);

            modelBuilder.Entity<Member>()
                .HasMany(e => e.BillDetails)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Member>()
                .HasMany(e => e.BookRecords)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Member>()
                .HasMany(e => e.DepositRecords)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Member>()
                .HasMany(e => e.ManagerIncomeDetails)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Member>()
                .HasMany(e => e.PetDiaries)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Member>()
                .HasMany(e => e.PetProfiles)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PetDiary>()
                .Property(e => e.Type)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PetDiary>()
                .Property(e => e.Weight)
                .HasPrecision(3, 2);

            modelBuilder.Entity<PetDiary>()
                .HasMany(e => e.Photos)
                .WithOptional(e => e.PetDiary)
                .HasForeignKey(e => e.PetDiariesId);

            modelBuilder.Entity<PetProfile>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<PetProfile>()
                .Property(e => e.Gender)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PetProfile>()
                .Property(e => e.Species)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PetProfile>()
                .Property(e => e.Breed)
                .IsUnicode(false);

            modelBuilder.Entity<PetProfile>()
                .HasMany(e => e.BillDetails)
                .WithRequired(e => e.PetProfile)
                .HasForeignKey(e => e.PetId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PetProfile>()
                .HasMany(e => e.BookRecords)
                .WithRequired(e => e.PetProfile)
                .HasForeignKey(e => e.PetId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PetProfile>()
                .HasMany(e => e.PetsTags)
                .WithRequired(e => e.PetProfile)
                .HasForeignKey(e => e.PetProfilesId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Photo>()
                .Property(e => e.FileName)
                .IsUnicode(false);

            modelBuilder.Entity<Photo>()
                .HasMany(e => e.PetsTags)
                .WithRequired(e => e.Photo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PictureFile>()
                .Property(e => e.MediaPath)
                .IsUnicode(false);
        }
    }
}
