﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace AHM.Logistic.Smart.Entities.Entities
{
    public partial class tbEventLog
    {
        public int event_Id { get; set; }
        public int event_Eventtype { get; set; }
        public int? event_User { get; set; }
        public string event_Details { get; set; }
        public string event_IpAddress { get; set; }
        public string event_UserAgent { get; set; }
        public string event_PreviousState { get; set; }
        public string event_NewState { get; set; }
        public DateTime event_CreationDate { get; set; }

        public virtual tbEventLogType event_EventtypeNavigation { get; set; }
    }
}