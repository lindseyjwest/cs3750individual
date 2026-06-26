using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace cs3750indiv.Models;

[Table("menu_categories")]
public class MenuCategory
{
    [Key]
    [Column("category_id")]
    public int CategoryId { get; set; }

    [Required]
    [Column("category_name")]
    public string CategoryName { get; set; } = string.Empty;

    [Column("description")]
    public string? Description { get; set; }

    public ICollection<MenuItem> MenuItems { get; set; } = [];
}
