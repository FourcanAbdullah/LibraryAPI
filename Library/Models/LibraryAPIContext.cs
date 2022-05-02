using Microsoft.EntityFrameworkCore;
using System.Diagnostics.CodeAnalysis;
using Library.Models;
namespace Library.Models
{
    public class LibraryAPIContext : DbContext
    {
        protected readonly IConfiguration Configuration;

        public LibraryAPIContext(DbContextOptions<LibraryAPIContext> options, IConfiguration configuration)
            : base(options)
        {
            Configuration = configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            var connectionString = Configuration.GetConnectionString("LibraryAPI_1");
            options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
        }

        public DbSet<Book> Books { get; set; } = null!;
        public DbSet<Borrower> Borrowers { get; set; } = null!;
    }
}
