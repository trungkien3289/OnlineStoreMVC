using OnlineStore.Model.Context;
using OnlineStore.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Service.Interfaces
{
    public interface IBrandManagementService
    {
        DetailsBrandManagementView GetDetailBrand(int id);
        bool AddBrand(Brand brand);
        Brand GetBrandById(int id);
        IEnumerable<Brand> GetAllBrands();
        bool UpdateBrand(Brand request);
        bool DeleteBrand(int id);
    }
}
