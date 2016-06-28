using OnlineStore.Model.Context;
using OnlineStore.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Service.Interfaces
{
    public interface ICMSCategoryService
    {
        IList<CMSCategoryView> GetCMSCategories(int pageNumber, int pageSize, out int totalItems);
        bool AddCMSCategory(CMSCategoryView categoryView);
    }
}
