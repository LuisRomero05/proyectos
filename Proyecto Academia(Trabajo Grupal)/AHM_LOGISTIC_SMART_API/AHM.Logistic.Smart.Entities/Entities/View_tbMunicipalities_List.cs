﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace AHM.Logistic.Smart.Entities.Entities
{
    public partial class View_tbMunicipalities_List
    {
        public int mun_Id { get; set; }
        public string mun_Code { get; set; }
        public string mun_Description { get; set; }
        public int dep_Id { get; set; }
        public string dep_Description { get; set; }
        public string Status { get; set; }
        public int? mun_IdUserCreate { get; set; }
        public string usu_UserNameCreate { get; set; }
        public DateTime? mun_DateCreate { get; set; }
        public int? mun_IdUserModified { get; set; }
        public string usu_UserNameModified { get; set; }
        public DateTime? mun_DateModified { get; set; }
    }
}