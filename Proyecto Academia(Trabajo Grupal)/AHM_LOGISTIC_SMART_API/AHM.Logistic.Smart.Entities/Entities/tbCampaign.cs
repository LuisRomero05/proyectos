﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace AHM.Logistic.Smart.Entities.Entities
{
    public partial class tbCampaign
    {
        public tbCampaign()
        {
            tbCampaignDetails = new HashSet<tbCampaignDetails>();
        }

        public int cam_Id { get; set; }
        public string cam_Nombre { get; set; }
        public string cam_Descripcion { get; set; }
        public string cam_Html { get; set; }
        public bool cam_Status { get; set; }
        public int cam_IdUserCreate { get; set; }
        public DateTime cam_DateCreate { get; set; }

        public virtual ICollection<tbCampaignDetails> tbCampaignDetails { get; set; }
    }
}