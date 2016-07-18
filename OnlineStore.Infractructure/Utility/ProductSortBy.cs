using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Infractructure.Utility
{
    public enum ProductsSortBy
    {
        [Description("Giá: từ cao xuống thấp")]
        PriceHighToLow = 1,
        [Description("Giá: từ thấp lên cao")]
        PriceLowToHigh = 2,
        [Description("Tên: từ A đến Z")]
        ProductNameAToZ = 3,
        [Description("Tên: từ Z đến A")]
        ProductNameZToA = 4    
    }
}
