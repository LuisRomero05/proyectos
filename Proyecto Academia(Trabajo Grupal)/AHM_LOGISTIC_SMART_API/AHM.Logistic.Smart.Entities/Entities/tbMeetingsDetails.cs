﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace AHM.Logistic.Smart.Entities.Entities
{
    public partial class tbMeetingsDetails
    {
        public int mde_Id { get; set; }
        public int met_Id { get; set; }
        public int? cus_Id { get; set; }
        public int? emp_Id { get; set; }
        public int? cont_Id { get; set; }
        public bool mde_Status { get; set; }
        public int mde_IdUserCreate { get; set; }
        public DateTime mde_DateCreate { get; set; }
        public int? mde_IdUserModified { get; set; }
        public DateTime? mde_DateModified { get; set; }

        public virtual tbContacts cont { get; set; }
        public virtual tbCustomers cus { get; set; }
        public virtual tbEmployees emp { get; set; }
        public virtual tbMeetings met { get; set; }
    }
}