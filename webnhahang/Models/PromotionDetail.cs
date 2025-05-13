using System;
using System.Collections.Generic;

namespace webnhahang.Models;

public partial class PromotionDetail
{
    public int PromotionDetailId { get; set; }

    public int PromotionId { get; set; }

    public int FoodId { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Food Food { get; set; } = null!;

    public virtual Promotion Promotion { get; set; } = null!;
}
