using OnlineStore.Model.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.Repository
{
    public class CategoryRepository : Repository<ecom_Categories>
    {
        public CategoryRepository(OnlineStoreMVCEntities context)
            : base(context)
        {

        }
        public IEnumerable<ecom_Categories> GetAllCategories()
        {
            return dbSet.ToList();
        }

        public IEnumerable<ecom_Categories> GetRootCategoryList()
        {
            return dbSet.Where(c => c.ParentId == null).ToList();
        }
    }
}
