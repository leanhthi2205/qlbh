using System;
using System.Collections.Generic;

namespace webnhahang.Models;

public partial class Food
{
    public int FoodId { get; set; }

    public string FoodName { get; set; } = null!;

    public int? CategoryId { get; set; }

    public string? Description { get; set; }

    public decimal Price { get; set; }

    public string? ImageUrl { get; set; }

    public bool? IsAvailable { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Category? Category { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual ICollection<PreOrder> PreOrders { get; set; } = new List<PreOrder>();

    public virtual ICollection<PromotionDetail> PromotionDetails { get; set; } = new List<PromotionDetail>();
}
