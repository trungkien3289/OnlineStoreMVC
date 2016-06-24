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
        IEnumerable<Category> GetAllCategories();
        Category GetCategoryById(int id);
        bool AddCategory(Category category);
        bool UpdateCategory(Category category);
        bool DeleteCategory(int id);
        IEnumerable<Category> GetRootCategoryList();
    }
}
