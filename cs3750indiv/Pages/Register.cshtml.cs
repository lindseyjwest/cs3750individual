using System.ComponentModel.DataAnnotations;
using cs3750indiv.Data;
using cs3750indiv.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace cs3750indiv.Pages;

public class RegisterModel(AppDbContext db) : PageModel
{
    [BindProperty]
    public InputModel Input { get; set; } = new();

    public string? SuccessMessage { get; set; }

    public class InputModel
    {
        [Required]
        [Display(Name = "Full Name")]
        public string FullName { get; set; } = string.Empty;

        [Required]
        [EmailAddress]
        [Display(Name = "Email Address")]
        public string Email { get; set; } = string.Empty;

        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; } = string.Empty;

        [Required]
        [MinLength(6)]
        [DataType(DataType.Password)]
        public string Password { get; set; } = string.Empty;
    }

    public void OnGet() { }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
            return Page();

        var hasher = new PasswordHasher<AppUser>();
        var user = new AppUser
        {
            FullName = Input.FullName,
            Email = Input.Email,
            PhoneNumber = Input.PhoneNumber,
        };
        user.PasswordHash = hasher.HashPassword(user, Input.Password);

        db.AppUsers.Add(user);
        await db.SaveChangesAsync();

        SuccessMessage = $"Account created successfully, {user.FullName}!";
        ModelState.Clear();
        Input = new InputModel();
        return Page();
    }
}
