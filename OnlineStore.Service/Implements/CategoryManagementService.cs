using OnlineStore.Model.Context;
using OnlineStore.Model.Repository;
using OnlineStore.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Service.Implements
{
    public class CategoryManagementService : ICategoryManagementService
    {
        #region Properties
        private CategoryRepository db = new CategoryRepository(new OnlineStoreMVCEntities());
        #endregion

        #region Public functions

        public IEnumerable<ecom_Categories> GetAllCategories()
        {
            return db.GetAllCategories();
        }

        public ecom_Categories GetCategoryById(int id)
        {
            return db.GetByID(id);
        }

        public bool AddCategory(ecom_Categories category)
        {
            try
            {
                db.Insert(category);
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool UpdateCategory(ecom_Categories category)
        {
            try
            {
                db.Update(category);
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteCategory(int id)
        {
            try
            {
                ecom_Categories category = db.GetByID(id);
                db.Delete(category);
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public IEnumerable<ecom_Categories> GetRootCategoryList()
        {
            return db.GetRootCategoryList();
        }

        #endregion
    }
}
