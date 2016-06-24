using OnlineStore.Model.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.Repository
{
    public class CategoryRepository:Repository<Category>
    {
        public CategoryRepository(OnlineStoreMVCEntities context)
            : base(context)
        {

        }
        public IEnumerable<Category> GetAllCategories()
        {
            return dbSet.ToList();
        }

        public IEnumerable<Category> GetRootCategoryList()
        {
            return dbSet.Where(c => c.ParentID == null).ToList();
        }
    }
}
