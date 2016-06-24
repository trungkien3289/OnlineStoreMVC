using OnlineStore.Model.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.Repository
{
    public class BrandRepository : Repository<Brand>
    {
        public BrandRepository(OnlineStoreMVCEntities context):base(context)
        {
            
        }
        public IList<Brand> GetAllBrands()
        {
            return dbSet.ToList();
        }
    }
}
