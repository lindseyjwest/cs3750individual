using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace cs3750indiv.Models;

[Table("menu_items")]
public class MenuItem
{
    [Key]
    [Column("menu_item_id")]
    public int MenuItemId { get; set; }

    [Required]
    [Column("item_name")]
    public string ItemName { get; set; } = string.Empty;

    [Column("item_description")]
    public string? ItemDescription { get; set; }

    [Required]
    [Column("price")]
    public decimal Price { get; set; }

    [Column("image_url")]
    public string? ImageUrl { get; set; }

    [Column("category_id")]
    public int CategoryId { get; set; }

    public MenuCategory Category { get; set; } = null!;

    public ICollection<MenuAccess> MenuAccesses { get; set; } = [];
}
