using OnlineStore.Model.Context;
using OnlineStore.Model.Repository;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineStore.Model.Mapper;

namespace OnlineStore.Service.Implements
{
    public class CMSCategoryService : ICMSCategoryService
    {
        public IList<CMSCategoryView> GetCMSCategories()
        {
            using (var db = new OnlineStoreMVCEntities())
            {
                return db.cms_Categories.Where(x => x.Status == (int)OnlineStore.Infractructure.Utility.Define.Status.Active).OrderBy(x => x.SortOrder)
                    .Select(x => new CMSCategoryView
                    {
                        Id = x.Id,
                        ParentId = x.ParentId,
                        Title = x.Title,
                        Url = x.Url,
                        Description = x.Description,
                        Status = x.Status
                    }).ToList();
            }
        }
    }
}
