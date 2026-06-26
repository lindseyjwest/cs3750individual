using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace cs3750indiv.Models;

[Table("app_users")]
public class AppUser
{
    [Key]
    [Column("user_id")]
    public int UserId { get; set; }

    [Required]
    [Column("full_name")]
    public string FullName { get; set; } = string.Empty;

    [Required]
    [Column("email")]
    public string Email { get; set; } = string.Empty;

    [Column("phone")]
    public string? Phone { get; set; }

    [Required]
    [Column("password")]
    public string PasswordHash { get; set; } = string.Empty;

    public ICollection<MenuAccess> MenuAccesses { get; set; } = [];
}
