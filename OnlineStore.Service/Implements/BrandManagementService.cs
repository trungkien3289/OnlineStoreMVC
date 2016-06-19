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
    public class BrandManagementService : IBrandManagementService
    {
        private BrandRepository db = new BrandRepository(new OnlineStoreMVCEntities());  
        public Model.ViewModel.DetailsBrandManagementView GetDetailBrand(int id)
        {
            Brand brand = db.GetByID(id);
            if (brand == null) { throw new ArgumentNullException();}

            return brand.ConvertToDetailsBrandView();
        }
    }
}
