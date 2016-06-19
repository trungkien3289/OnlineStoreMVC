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
        Order
    }
    public static class AdminNavigateHelper
    {
        private static Dictionary<int, string> dict = new Dictionary<int, string>(){
            {(int)AdminNavigateEnum.DashBoard,"QUAN TRI"},
            {(int)AdminNavigateEnum.Member,"THANH VIEN"},
            {(int)AdminNavigateEnum.Product,"SAN PHAM"},
            {(int)AdminNavigateEnum.Manufacturer,"NHA CUNG CAP"},
            {(int)AdminNavigateEnum.News,"TIN TUC"},
            {(int)AdminNavigateEnum.Order,"DON DAT HANG"}
        }; 
        public static string getNavigateItemName(AdminNavigateEnum item)
        {
            return dict[(int)item];
        }
    }
}
