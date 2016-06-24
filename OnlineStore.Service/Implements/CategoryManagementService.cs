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

        public IEnumerable<Category> GetAllCategories()
        {
            return db.GetAllCategories();
        }

        public Category GetCategoryById(int id)
        {
            return db.GetByID(id);
        }

        public bool AddCategory(Category category)
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

        public bool UpdateCategory(Category category)
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
                Category category = db.GetByID(id);
                db.Delete(category);
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public IEnumerable<Category> GetRootCategoryList()
        {
            return db.GetRootCategoryList();
        }

        #endregion
    }
}
