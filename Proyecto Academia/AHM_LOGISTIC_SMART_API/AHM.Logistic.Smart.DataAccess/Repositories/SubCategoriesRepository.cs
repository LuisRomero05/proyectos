﻿using AHM.Logistic.Smart.Common.Models;
using AHM.Logistic.Smart.Entities.Entities;
using Dapper;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace AHM.Logistic.Smart.DataAccess.Repositories
{
    public class SubCategoriesRepository : IRepository<tbSubCategories, View_tbSubCategories_List>
    {
        public int Delete(int Id, int Mod)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@scat_Id", Id, DbType.Int32, ParameterDirection.Input);
            parameters.Add("@scat_IdUserModified", Mod, DbType.Int32, ParameterDirection.Input);
            using var db = new SqlConnection(LogisticSmartContext.ConnectionString);
            return db.ExecuteScalar<int>(ScriptsDataBase.UDP_tbSubCategories_DELETE, parameters, commandType: CommandType.StoredProcedure);
        }

        public View_tbSubCategories_List Search(Expression<Func<View_tbSubCategories_List, bool>> expression = null)
        {
            using var db = new LogisticSmartContext();
            return db.View_tbSubCategories_List.Where(expression).FirstOrDefault();
        }

        public tbSubCategories Find(Expression<Func<tbSubCategories, bool>> expression = null)
        {
            using var db = new LogisticSmartContext();
            return db.tbSubCategories.Where(expression).FirstOrDefault();
        }

        public int Insert(tbSubCategories item)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@scat_Description", item.scat_Description, DbType.String, ParameterDirection.Input);
            parameters.Add("@cat_Id", item.cat_Id, DbType.Int32, ParameterDirection.Input);
            parameters.Add("@scat_IdUserCreate", item.scat_IdUserCreate, DbType.Int32, ParameterDirection.Input);
            using var db = new SqlConnection(LogisticSmartContext.ConnectionString);
            return db.ExecuteScalar<int>(ScriptsDataBase.UDP_tbSubCategories_INSERT, parameters, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<View_tbSubCategories_List> List()
        {
            using var db = new LogisticSmartContext();
            return db.View_tbSubCategories_List.ToList();
        }

        public int Update(int Id, tbSubCategories item)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@scat_Id", Id, DbType.Int32, ParameterDirection.Input);
            parameters.Add("@scat_Description", item.scat_Description, DbType.String, ParameterDirection.Input);
            parameters.Add("@cat_Id", item.cat_Id, DbType.Int32, ParameterDirection.Input);
            parameters.Add("@scat_IdUserModified", item.scat_IdUserModified, DbType.Int32, ParameterDirection.Input);
            using var db = new SqlConnection(LogisticSmartContext.ConnectionString);
            return db.ExecuteScalar<int>(ScriptsDataBase.UDP_tbSubCategories_UPDATE, parameters, commandType: CommandType.StoredProcedure);
        }
    }
}
