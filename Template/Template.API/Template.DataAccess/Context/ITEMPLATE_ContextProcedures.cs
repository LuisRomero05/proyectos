﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading;
using System.Threading.Tasks;
using Template.DataAccess.Context;

namespace Template.DataAccess.Context
{
    public partial interface ITEMPLATE_ContextProcedures
    {
        Task<int> UDP_Areas_DELETEAsync(int? Id, int? are_IdUserModified, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
        Task<int> UDP_Areas_REGISTERAsync(string are_Description, int? are_IdUserCreate, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
        Task<int> UDP_Areas_UPDATEAsync(int? Id, string are_Description, int? are_IdUserModified, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
    }
}