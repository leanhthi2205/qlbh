using System;
using System.Collections.Generic;

namespace webnhahang.Models;

public partial class PreOrder
{
    public int PreOrderId { get; set; }

    public int? ReservationId { get; set; }

    public int? FoodId { get; set; }

    public int Quantity { get; set; }

    public string? Notes { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Food? Food { get; set; }

    public virtual Reservation? Reservation { get; set; }
}
