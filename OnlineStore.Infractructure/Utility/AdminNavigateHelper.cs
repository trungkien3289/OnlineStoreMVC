using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Infractructure.Utility
{
    public enum AdminNavigateEnum
    {
        DashBoard,
        Member,
        Product,
        Manufacturer,
        News,
        Order,
        Category
    }
    public static class AdminNavigateHelper
    {
        private static Dictionary<int, string> dict = new Dictionary<int, string>(){
            {(int)AdminNavigateEnum.DashBoard,"QUẢN TRỊ"},
            {(int)AdminNavigateEnum.Member,"THÀNH VIÊN"},
            {(int)AdminNavigateEnum.Product,"SẢN PHẨM"},
            {(int)AdminNavigateEnum.Manufacturer,"NHÀ CUNG CẤP"},
            {(int)AdminNavigateEnum.News,"TIN TỨC"},
            {(int)AdminNavigateEnum.Order,"ĐƠN ĐẶT HÀNG"},
            {(int)AdminNavigateEnum.Category,"DANH MỤC SẢN PHẨM"}
        }; 
        public static string getNavigateItemName(AdminNavigateEnum item)
        {
            return dict[(int)item];
        }
    }
}
