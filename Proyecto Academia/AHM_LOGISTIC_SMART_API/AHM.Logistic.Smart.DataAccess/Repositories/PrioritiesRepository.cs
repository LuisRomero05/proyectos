﻿using AHM.Logistic.Smart.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace AHM.Logistic.Smart.DataAccess.Repositories
{
    public class PrioritiesRepository : IRepository<tbPriorities, View_tbPriorities_List>
    {
        public int Delete(int Id, int Mod)
        {
            throw new NotImplementedException();
        }

        public tbPriorities Find(Expression<Func<tbPriorities, bool>> expression = null)
        {
            throw new NotImplementedException();
        }

        public int Insert(tbPriorities item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<View_tbPriorities_List> List()
        {
            using var db = new LogisticSmartContext();
            return db.View_tbPriorities_List.ToList();
        }

        public View_tbPriorities_List Search(Expression<Func<View_tbPriorities_List, bool>> expression = null)
        {
            throw new NotImplementedException();
        }

        public int Update(int Id, tbPriorities item)
        {
            throw new NotImplementedException();
        }
    }
}
