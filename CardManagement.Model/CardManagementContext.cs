using CardManagement.Model.Models;
using Microsoft.EntityFrameworkCore;

namespace CardManagement.Model
{
    public class CardManagementContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

            optionsBuilder.UseSqlServer(@"Server=localhost ,1415;Database=b;User Id=sa;Password=Database!2021;TrustServerCertificate=true");
        }

        public DbSet<Customer> Customers { get; set; }
        public DbSet<Account> Accounts { get; set; }

        public DbSet<Transaction> Transactions { get; set; }

    }
}
