﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace AHM.Logistic.Smart.Entities.Entities
{
    public partial class View_tbPersons_List
    {
        public int per_Id { get; set; }
        public string per_Identidad { get; set; }
        public string per_Firstname { get; set; }
        public string per_Secondname { get; set; }
        public string per_LastNames { get; set; }
        public DateTime per_BirthDate { get; set; }
        public string per_Sex { get; set; }
        public string per_Email { get; set; }
        public string per_Phone { get; set; }
        public string per_Direccion { get; set; }
        public int dep_Id { get; set; }
        public string dep_Description { get; set; }
        public int mun_Id { get; set; }
        public string mun_Description { get; set; }
        public string per_Esciv { get; set; }
        public string Status { get; set; }
        public int? per_IdUserCreate { get; set; }
        public string usu_UserNameCreate { get; set; }
        public DateTime? per_DateCreate { get; set; }
        public int? per_IdUserModified { get; set; }
        public string usu_UserNameModified { get; set; }
        public DateTime? per_DateModified { get; set; }
    }
}