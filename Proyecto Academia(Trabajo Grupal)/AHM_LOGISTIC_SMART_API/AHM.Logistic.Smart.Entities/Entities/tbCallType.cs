﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace AHM.Logistic.Smart.Entities.Entities
{
    public partial class tbCallType
    {
        public tbCallType()
        {
            tbCustomerCalls = new HashSet<tbCustomerCalls>();
        }

        public int cati_Id { get; set; }
        public string cati_Description { get; set; }
        public bool cati_Status { get; set; }

        public virtual ICollection<tbCustomerCalls> tbCustomerCalls { get; set; }
    }
}