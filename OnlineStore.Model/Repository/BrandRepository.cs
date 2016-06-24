using OnlineStore.Model.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.Repository
{
    public class BrandRepository : Repository<ecom_Brands>
    {
        public BrandRepository(OnlineStoreMVCEntities context):base(context)
        {
            
        }
        public IList<ecom_Brands> GetAllBrands()
        {
            return dbSet.ToList();
        }
    }
}
