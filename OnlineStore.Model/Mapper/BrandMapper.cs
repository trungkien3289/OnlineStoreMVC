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
        public static DetailsBrandManagementView ConvertToDetailsBrandView(this ecom_Brands brand)
        {
            DetailsBrandManagementView returnView = new DetailsBrandManagementView()
            {
                Id = brand.Id,
                Name = brand.Name,
                Status = Enum.IsDefined(typeof(Status), brand.Status)?((Status)brand.Status).ToString():"",
                Description = brand.Description
            };

            return returnView;
        }
    }
}
