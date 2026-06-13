using cs3750indiv.Models;
using Microsoft.EntityFrameworkCore;

namespace cs3750indiv.Data;

public class AppDbContext(DbContextOptions<AppDbContext> options) : DbContext(options)
{
    public DbSet<AppUser> AppUsers { get; set; }
}
