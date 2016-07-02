using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OnlineStore.Model.Context;
using OnlineStore.Service.Interfaces;
using OnlineStore.Service.Implements;
using OnlineStore.Model.ViewModel;
using OnlineStore.Infractructure.Utility;
using OnlineStore.Infractructure.Helper;
using OnlineStore.Model.MessageModel;

namespace OnlineStoreMVC.Areas.Admin.Controllers
{
    public class CategoryController : BaseManagementController
    {
        private ICategoryManagementService service = new CategoryManagementService();

        // GET: Admin/Category
        public ActionResult Index()
        {
            return View(service.GetListCategories());
        }

        // GET: Admin/Category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetailCategoryViewModel category = service.GetDetailCategory((int)id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admin/Category/Create
        public ActionResult Create()
        {
            PopulateStatusDropDownList();
            PopulateParentCategoryDropDownList();
            return View();
        }

        // POST: Admin/Category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create(CreateCategoryPostRequest category)
        {
            if (ModelState.IsValid)
            {
                bool isSuccess = service.AddCategory(category);
                if (isSuccess)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("Server error", "Add new category fail.");
                }
            }

            return View(category);
        }

        // GET: Admin/Category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategoryViewModel category = service.getCategoryViewModel((int)id);
            if (category == null)
            {
                return HttpNotFound();
            }

            PopulateStatusDropDownList((Define.Status)Define.Status.Parse(typeof(Define.Status), category.Status));
            PopulateParentCategoryDropDownList(category.ParentId, id);
            return View(category);
        }

        // POST: Admin/Category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CategoryViewModel category)
        {
            if (ModelState.IsValid)
            {
                service.UpdateCategory(category);
                return RedirectToAction("Index");
            }
            return View(category);
        }

        // POST: Admin/Category/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            bool isSuccess = service.DeleteCategory(id);
            if (!isSuccess)
            {
                ModelState.AddModelError("ServerError", "Delete brand fail!");
            }
            return RedirectToAction("Index");
        }

        /// <summary>
        /// Create  Category SelectList using as DataSource of ParentId DropDownList 
        /// </summary>
        /// <param name="parentId"></param>
        /// <param name="id"></param>
        private void PopulateParentCategoryDropDownList(int? parentId = null,int? id = null)
        {
            IEnumerable<ecom_Categories> listCategories;
            IEnumerable<ecom_Categories> categories = service.GetAllCategories();
            if (parentId!=null)
            {
                listCategories = categories.Where(c => c.Id != id).ToList();
            }
            else
            {
                listCategories = categories;
            }

            IEnumerable<SelectListItem> items = from category in listCategories
                                                select new SelectListItem
                                                {
                                                    Text = category.Name,
                                                    Value = category.Id.ToString(),
                                                    Selected = category.Id == parentId
                                                };
            ViewBag.ParentId = items;
        }
    }
}
