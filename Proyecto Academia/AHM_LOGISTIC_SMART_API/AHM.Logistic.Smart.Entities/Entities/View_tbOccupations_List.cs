﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace AHM.Logistic.Smart.Entities.Entities
{
    public partial class View_tbOccupations_List
    {
        public int occ_Id { get; set; }
        public string occ_Description { get; set; }
        public string Status { get; set; }
        public int occ_IdUserCreate { get; set; }
        public string usu_UserNameCreate { get; set; }
        public DateTime occ_DateCreate { get; set; }
        public int? occ_IdUserModified { get; set; }
        public string usu_UserNameModified { get; set; }
        public DateTime? occ_DateModified { get; set; }
    }
}