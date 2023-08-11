﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AHM.Logistic.Smart.Common.Models
{
    public class CustomersFileViewModel
    {
        public int cfi_Id { get; set; }
        public string cfi_fileRoute { get; set; }
        public int cus_Id { get; set; }
        public int cfi_IdUserCreate { get; set; }
        public string Status { get; set; }
        public DateTime cfi_DateCreate { get; set; }
        public int cfi_IdUserModified { get; set; }
    }
}
