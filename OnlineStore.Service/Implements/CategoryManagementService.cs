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
using OnlineStore.Model.MessageModel;
using OnlineStore.Infractructure.Utility;

namespace OnlineStore.Service.Implements
{
    public class CategoryManagementService : ICategoryManagementService
    {
        #region Properties
        private CategoryRepository db = new CategoryRepository(new OnlineStoreMVCEntities());
        private Repository<system_Profiles> systemProfiles = new Repository<system_Profiles>(new OnlineStoreMVCEntities());
        #endregion

        #region Public functions
        /// <summary>
        /// Get list summary category, which have status is Active or Deactive
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SummaryCategoryViewModel> GetListCategories()
        {
            return db.GetAllCategoriesWithoutDelete().ConvertToIndexCategoryViews();
        }

        public IEnumerable<ecom_Categories> GetAllCategories()
        {
            return db.GetAllCategoriesWithoutDelete();
        }
        /// <summary>
        /// Get list categories with paging, sort, filter
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SummaryCategoryViewModel> GetCategories(int pageNumber, int pageSize, out int totalItems)
        {
            IEnumerable<ecom_Categories> categories = db.GetAllCategoriesWithoutDelete();
            totalItems = categories.Count();
            IEnumerable<ecom_Categories> returnCategoryList = categories.OrderBy(b => b.Name).Skip(pageSize * (pageNumber - 1)).Take(pageSize);
            return returnCategoryList.ConvertToIndexCategoryViews();
        }
        /// <summary>
        /// Get detail category after id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public DetailCategoryViewModel GetDetailCategory(int id)
        {
            string parentCategory = "";
           ecom_Categories category = db.GetByID(id);
           if (category == null) {
               return null;
           }
           else
           {
               // Get user create brand and user last time modified brand 
               system_Profiles createBy = systemProfiles.GetByID(category.CreatedBy);
               system_Profiles modifiredBy = systemProfiles.GetByID(category.CreatedBy);
               // get parent category
               if (category.ParentId != null)
               {
                   ecom_Categories parent = db.GetByID(category.ParentId);
                   parentCategory = parent != null ? parent.Name : "";
               }

               return category.ConvertToDetailCategoryViewModel(parentCategory, createBy, modifiredBy);
           }
        } 

        /// <summary>
        /// Get category by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ecom_Categories GetCategoryById(int id)
        {
            ecom_Categories category = db.GetCategoryById(id);
            if (category != null && category.Status != (int)Define.Status.Delete)
            {
                return category;
            }
            else
            {
                return null;
            }
        }

        public bool AddCategory(CreateCategoryPostRequest category)
        {
            try
            {
                db.Insert(category.ConvertToCategoryModel());
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool UpdateCategory(CategoryViewModel viewModel)
        {
            try
            {
                ecom_Categories category = db.GetByID(viewModel.Id);
                category.Name = viewModel.Name;
                category.Description = viewModel.Description;
                category.Url = viewModel.Url;
                category.SortOrder = viewModel.SortOrder;
                category.Status = (int)Define.Status.Parse(typeof(Define.Status), viewModel.Status);
                category.ParentId = viewModel.ParentId;

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
                category.Status = (int)Define.Status.Delete;
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

        public CategoryViewModel getCategoryViewModel(int id){
            ecom_Categories category = db.GetCategoryById(id);
            if(category != null){
                //string parentName = "";
                //if(category.ParentId!=null){
                //    ecom_Categories parentCategory = db.GetCategoryById((int)category.ParentId);
                //    parentName = parentCategory !=null ? parentCategory.Name : "";
                //}

                return category.ConvertToCategoryViewModel();
            }else{
                return null;
            }
        }

        #endregion
    }
}
