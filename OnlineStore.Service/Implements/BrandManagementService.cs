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
using OnlineStore.Infractructure.Utility;

namespace OnlineStore.Service.Implements
{
    public class BrandManagementService : IBrandManagementService
    {
        #region Properties
        private BrandRepository db = new BrandRepository(new OnlineStoreMVCEntities());
        private Repository<system_Profiles> systemProfiles = new Repository<system_Profiles>(new OnlineStoreMVCEntities());

        #endregion

        #region Public functions
        public Model.ViewModel.DetailsBrandManagementView GetDetailBrand(int id)
        {
            ecom_Brands brand = db.GetByID(id);
            if (brand == null) { throw new ArgumentNullException(); }
            // Get user create brand and user last time modified brand 
            system_Profiles createBy = systemProfiles.GetByID(brand.CreatedBy);
            system_Profiles modifiredBy = systemProfiles.GetByID(brand.CreatedBy);

            return brand.ConvertToDetailsBrandView(createBy != null ? createBy.UserName : "", modifiredBy != null ? modifiredBy.UserName : "");
        }

        public bool AddBrand(ecom_Brands brand)
        {
            try
            {
                db.Insert(brand);
                db.Save();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public ecom_Brands GetBrandById(int id)
        {
            ecom_Brands brand = db.GetByID(id);
            return brand;
        }

        public IEnumerable<ecom_Brands> GetBrands(int pageNumber, int pageSize, out int totalItems)
        {
            IEnumerable<ecom_Brands> brands = db.GetAllBrands();
            totalItems = brands.Count();
            IEnumerable<ecom_Brands> returnBrandList = brands.OrderBy(b => b.Name).Skip(pageSize * (pageNumber - 1)).Take(pageSize);
            return returnBrandList;
        }

        public bool UpdateBrand(ecom_Brands brand)
        {
            try
            {
                db.Update(brand);
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteBrand(int id)
        {
            try
            {
                ecom_Brands brand = db.GetByID(id);
                brand.Status = (int)Define.Status.Delete;
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        #endregion
    }
}
