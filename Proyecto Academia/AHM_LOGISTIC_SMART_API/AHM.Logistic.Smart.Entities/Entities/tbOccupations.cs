﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace AHM.Logistic.Smart.Entities.Entities
{
    public partial class tbOccupations
    {
        public tbOccupations()
        {
            tbContacts = new HashSet<tbContacts>();
            tbEmployees = new HashSet<tbEmployees>();
        }

        public int occ_Id { get; set; }
        public string occ_Description { get; set; }
        public bool occ_Status { get; set; }
        public int occ_IdUserCreate { get; set; }
        public DateTime occ_DateCreate { get; set; }
        public int? occ_IdUserModified { get; set; }
        public DateTime? occ_DateModified { get; set; }

        public virtual ICollection<tbContacts> tbContacts { get; set; }
        public virtual ICollection<tbEmployees> tbEmployees { get; set; }
    }
}