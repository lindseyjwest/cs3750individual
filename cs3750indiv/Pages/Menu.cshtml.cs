using cs3750indiv.Data;
using cs3750indiv.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace cs3750indiv.Pages;

public class MenuModel(AppDbContext db) : PageModel
{
    public List<MenuItem> MenuItems { get; set; } = [];
    public string UserName { get; set; } = string.Empty;

    public async Task<IActionResult> OnGetAsync()
    {
        var userId = HttpContext.Session.GetInt32("UserId");
        if (userId == null)
            return RedirectToPage("/Login");

        UserName = HttpContext.Session.GetString("UserName") ?? string.Empty;

        var accesses = await db.MenuAccesses
            .Where(a => a.UserId == userId && a.CanView)
            .Include(a => a.MenuItem)
                .ThenInclude(m => m.Category)
            .ToListAsync();

        MenuItems = accesses.Select(a => a.MenuItem).ToList();

        return Page();
    }
}
