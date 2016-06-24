using OnlineStore.Model.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Service.Interfaces
{
    public interface ICategoryManagementService
    {
        IEnumerable<ecom_Categories> GetAllCategories();
        ecom_Categories GetCategoryById(int id);
        bool AddCategory(ecom_Categories category);
        bool UpdateCategory(ecom_Categories category);
        bool DeleteCategory(int id);
        IEnumerable<ecom_Categories> GetRootCategoryList();
    }
}
