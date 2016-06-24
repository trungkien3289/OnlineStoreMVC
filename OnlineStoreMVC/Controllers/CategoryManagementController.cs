using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OnlineStore.Model.Context;
using OnlineStore.Service.Implements;
using OnlineStore.Service.Interfaces;

namespace OnlineStoreMVC.Controllers
{
    public class CategoryManagementController : Controller
    {
        private ICategoryManagementService service = new CategoryManagementService();
        // GET: CategoryManagement
        public ActionResult Index()
        {
            return View(service.GetAllCategories());
        }

        // GET: CategoryManagement/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = service.GetCategoryById((int)id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: CategoryManagement/Create
        public ActionResult Create()
        {
            PopulateParentCategoryDropDownList(null);
            return View();
        }

        // POST: CategoryManagement/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,GUID,ParentID,Description,Url,SortOrder,Status")] Category category)
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
                    ModelState.AddModelError("ServerError", "Add new category fail!");
                }
            }

            return View(category);
        }

        // GET: CategoryManagement/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = service.GetCategoryById((int)id);

            if (category == null)
            {
                return HttpNotFound();
            }
            PopulateParentCategoryDropDownList(category.ParentID);
            return View(category);
        }

        // POST: CategoryManagement/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,ParentID,Description,Url,SortOrder,Status")] Category category)
        {
            if (ModelState.IsValid)
            {
                bool isSuccess = service.UpdateCategory(category);
                if (isSuccess)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("ServerError", "Update category fail!");
                }
            }
            return View(category);
        }

        // GET: CategoryManagement/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = service.GetCategoryById((int)id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: CategoryManagement/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            bool isSuccess = service.DeleteCategory(id);
            if (isSuccess)
            {
                ModelState.AddModelError("ServerError", "Delete category fail!");
            }
            return RedirectToAction("Index");
        }

        private void PopulateParentCategoryDropDownList(int? parentId)
        {
            IEnumerable<Category> rootCategoryList = service.GetRootCategoryList();
            ViewBag.ParentID = new SelectList(rootCategoryList, "Id", "Name", parentId);
        } 
    }
}
