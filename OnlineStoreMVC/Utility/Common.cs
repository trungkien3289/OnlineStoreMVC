using OnlineStore.Infractructure.Helper;
using OnlineStore.Infractructure.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.WebPages.Html;

namespace OnlineStoreMVC.Utility
{
    public class Common
    {
        public static IEnumerable<SelectListItem> getStatusSelectList(Define.Status selectedStatus)
        {
            IEnumerable<Define.Status> values =

                    Enum.GetValues(typeof(Define.Status))

                    .Cast<Define.Status>();

            IEnumerable<SelectListItem> items =

                from value in values

                select new SelectListItem

                {

                    Text = EnumHelper.GetDescriptionFromEnum((Define.Status)value),

                    Value = value.ToString(),

                    Selected = value == selectedStatus,

                };

            return items;

        }
    }
}