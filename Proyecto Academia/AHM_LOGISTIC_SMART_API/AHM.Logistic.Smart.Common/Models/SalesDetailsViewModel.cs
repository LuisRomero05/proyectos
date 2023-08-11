﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AHM.Logistic.Smart.Common.Models
{
   public class SalesDetailsViewModel
    {
        public int sor_Id { get; set; }
        public int cus_Id { get; set; }
        public int? cot_Id { get; set; }
        public int sta_Id { get; set; }
        public bool sor_Status { get; set; }
        public int sor_IdUserCreate { get; set; }
        public DateTime sor_DateCreate { get; set; }
        public int? sor_IdUserModified { get; set; }
        public DateTime? sor_DateModified { get; set; }
        public int ode_Id { get; set; }
        public int ode_Amount { get; set; }
        public int? pro_Id { get; set; }
        public decimal ode_TotalPrice { get; set; }
        public bool ode_Status { get; set; }
        public int ode_IdUserCreate { get; set; }
        public DateTime ode_DateCreate { get; set; }
        public int? ode_IdUserModified { get; set; }
        public DateTime? ode_DateModified { get; set; }
    }
}
