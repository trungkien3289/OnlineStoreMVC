﻿using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Messaging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Service.Interfaces
{
    public interface IDisplayProductService
    {
        GetProductsByCategoryResponse GetProductsByCategory(GetProductsByCategoryRequest request);
        ProductDetailsView GetProductDetails(int id);
        IEnumerable<ProductSummaryView> GetAllNewProduct();
        IEnumerable<ProductSummaryView> GetAllBestSellProduct();
        IEnumerable<ProductSummaryView> GetListHighPriorityOrderProduct();
        IEnumerable<SummaryCategoryViewModel> GetTopCategories();
    }
}
