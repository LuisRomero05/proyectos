﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace AHM.Logistic.Smart.Entities.Entities
{
    public partial class View_tbSubCategories_List
    {
        public int scat_Id { get; set; }
        public string scat_Description { get; set; }
        public int? cat_Id { get; set; }
        public string cat_Description { get; set; }
        public string Status { get; set; }
        public int scat_IdUserCreate { get; set; }
        public string usu_UserNameCreate { get; set; }
        public DateTime scat_DateCreate { get; set; }
        public int? scat_IdUserModified { get; set; }
        public string usu_UserNameModified { get; set; }
        public DateTime? scat_DateModified { get; set; }
    }
}