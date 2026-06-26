using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace cs3750indiv.Models;

[Table("menu_access")]
public class MenuAccess
{
    [Key]
    [Column("access_id")]
    public int AccessId { get; set; }

    [Column("user_id")]
    public int UserId { get; set; }

    [Column("menu_item_id")]
    public int MenuItemId { get; set; }

    [Column("can_view")]
    public bool CanView { get; set; } = true;

    public AppUser User { get; set; } = null!;

    public MenuItem MenuItem { get; set; } = null!;
}
