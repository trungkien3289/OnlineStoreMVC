using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.Context;
using OnlineStore.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.Mapper
{
    public static class BrandMapper
    {
        public static DetailsBrandManagementView ConvertToDetailsBrandView(this Brand brand)
        {
            DetailsBrandManagementView returnView = new DetailsBrandManagementView()
            {
                Id = brand.Id,
                Name = brand.Name,
                SortOrder = OrderPriorityHelper.GetOrderPriorityName(brand.SortOrder),
                Status = brand.Status,
                Description = brand.Description
            };

            return returnView;
        }
    }
}
