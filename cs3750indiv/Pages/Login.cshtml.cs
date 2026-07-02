using System.ComponentModel.DataAnnotations;
using cs3750indiv.Data;
using cs3750indiv.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace cs3750indiv.Pages;

public class LoginModel(AppDbContext db) : PageModel
{
    [BindProperty]
    public InputModel Input { get; set; } = new();

    public string? ErrorMessage { get; set; }

    public class InputModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email Address")]
        public string Email { get; set; } = string.Empty;

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; } = string.Empty;
    }

    public void OnGet() { }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
            return Page();

        var user = await db.AppUsers
            .FirstOrDefaultAsync(u => u.Email == Input.Email);

        if (user == null)
        {
            ErrorMessage = "Invalid email or password.";
            return Page();
        }

        var hasher = new PasswordHasher<AppUser>();
        var result = hasher.VerifyHashedPassword(user, user.PasswordHash, Input.Password);

        if (result == PasswordVerificationResult.Failed)
        {
            ErrorMessage = "Invalid email or password.";
            return Page();
        }

        HttpContext.Session.SetInt32("UserId", user.UserId);
        HttpContext.Session.SetString("UserName", user.FullName);
        return RedirectToPage("/Menu");
    }
}
