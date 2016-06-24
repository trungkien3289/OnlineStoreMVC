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
        #region Properties

        private BrandRepository db = new BrandRepository(new OnlineStoreMVCEntities());

        #endregion

        #region Public functions
        public Model.ViewModel.DetailsBrandManagementView GetDetailBrand(int id)
        {
            Brand brand = db.GetByID(id);
            if (brand == null) { throw new ArgumentNullException(); }

            return brand.ConvertToDetailsBrandView();
        }

        public bool AddBrand(Brand brand)
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

        public Brand GetBrandById(int id)
        {
            Brand brand = db.GetByID(id);
            return brand;
        }

        public IEnumerable<Brand> GetAllBrands()
        {
            IEnumerable<Brand> brands = db.GetAllBrands();
            return brands;
        }

        public bool UpdateBrand(Brand request)
        {
            try
            {
                Brand brand = db.GetByID(request.Id);
                brand.Status = request.Status;
                brand.SortOrder = request.SortOrder;
                brand.Description = request.Description;
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
                Brand brand = db.GetByID(id);
                db.Delete(brand);
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
