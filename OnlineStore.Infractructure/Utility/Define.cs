using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Infractructure.Utility
{
    public class Define
    {
        public enum Status
        {
            [Description("Ngưng hoạt động")]
            Deactive = 0,

            [Description("Đang hoạt động")]
            Active = 1,

            [Description("Xóa")]
            Delete = 1
        }

        public enum MenuEnum
        {
            [Description("Admin")]
            Admin = 1,

            [Description("User")]
            User = 2,
        }
    }
}
