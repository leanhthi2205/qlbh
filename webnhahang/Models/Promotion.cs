using System;
using System.Collections.Generic;

namespace webnhahang.Models;

public partial class Promotion
{
    public int PromotionId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public decimal? DiscountPercent { get; set; }

    public decimal? DiscountAmount { get; set; }

    public bool? IsActive { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<PromotionDetail> PromotionDetails { get; set; } = new List<PromotionDetail>();
}
