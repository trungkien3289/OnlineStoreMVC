﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.ViewModel;

namespace OnlineStore.Service.Messaging
{
    public class GetProductsByCategoryRequest
    {
        public GetProductsByCategoryRequest()
        {
            BrandIds = new List<int>();
        }

        public int CategoryId { get; set; }
        public List<int> BrandIds { get; set; }
        public ProductsSortBy SortBy { get; set; }
        public decimal? BeginPrice { get; set; }
        public decimal? EndPrice { get; set; }
        public int Index { get; set; }
        public string SearchString { get; set; }
        public int NumberOfResultsPerPage { get; set; }

    }

    public class GetProductsByCategoryResponse
    {
        public string SelectedCategoryName { get; set; }
        public int SelectedCategory { get; set; }
        public decimal? BeginPrice { get; set; }
        public decimal? EndPrice { get; set; }
        public List<int> BrandIds { get; set; }
        public int NumberOfTitlesFound { get; set; }
        public int TotalNumberOfPages { get; set; }
        public int CurrentPage { get; set; }
        public string SearchString { get; set; }
        public int SortBy { get; set; }
        public IEnumerable<ProductSummaryView> Products { get; set; }
        public IEnumerable<BrandSummaryView> Brands { get; set; }
    }
}