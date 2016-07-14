using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.ViewModel
{
    public class ProductSummaryView
    {
        public int Id { get; set; }
        public string BrandName { get; set; }
        public string Name { get; set; }
        public string Price { get; set; }
        public string CoverImageUrl { get; set; }
        public bool IsNew { get; set; }
        public string ShortDescription { get; set; }
    }

    public class BrandSummaryView
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
