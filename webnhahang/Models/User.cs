using System;
using System.Collections.Generic;

namespace webnhahang.Models;

public partial class User
{
    public int UserId { get; set; }

    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int? EmployeeId { get; set; }

    public string Role { get; set; } = null!;

    public bool? IsActive { get; set; }

    public DateTime? LastLogin { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Employee? Employee { get; set; }
}
