using cs3750indiv.Models;
using Microsoft.EntityFrameworkCore;

namespace cs3750indiv.Data;

public class AppDbContext(DbContextOptions<AppDbContext> options) : DbContext(options)
{
    public DbSet<AppUser> AppUsers { get; set; }
    public DbSet<MenuCategory> MenuCategories { get; set; }
    public DbSet<MenuItem> MenuItems { get; set; }
    public DbSet<MenuAccess> MenuAccesses { get; set; }
}
