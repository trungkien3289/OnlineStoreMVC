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
        bool AddBrand(ecom_Brands brand);
        ecom_Brands GetBrandById(int id);
        IEnumerable<ecom_Brands> GetAllBrands();
        bool UpdateBrand(ecom_Brands request);
        bool DeleteBrand(int id);
    }
}
