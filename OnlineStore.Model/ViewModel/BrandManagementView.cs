using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.ViewModel
{
    public class DetailsBrandManagementView
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }
        public string SortOrder { get; set; }
        public string Description { get; set; }
    }
    public class EditBrandManagementView
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public string Description { get; set; }
    }
}
