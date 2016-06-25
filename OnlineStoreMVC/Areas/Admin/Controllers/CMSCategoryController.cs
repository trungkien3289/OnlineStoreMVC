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
using PagedList;

namespace OnlineStoreMVC.Areas.Admin.Controllers
{
    public class CMSCategoryController : Controller
    {
        private ICMSCategoryService _cmsCategoryService = new CMSCategoryService();

        private OnlineStoreMVCEntities db = new OnlineStoreMVCEntities();

        // GET: /Admin/CMS_Category/
        public ActionResult Index(string keyword, int page = 1)
        {
            var categories = _cmsCategoryService.GetCMSCategories();
            return View(categories.ToList().ToPagedList(page, 10));
        }

        // GET: /Admin/CMS_Category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            cms_Categories cms_categories = db.cms_Categories.Find(id);
            if (cms_categories == null)
            {
                return HttpNotFound();
            }
            return View(cms_categories);
        }

        // GET: /Admin/CMS_Category/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/CMS_Category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,ParentId,Title,Description,Url,SortOrder,Status,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate")] cms_Categories cms_categories)
        {
            if (ModelState.IsValid)
            {
                db.cms_Categories.Add(cms_categories);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(cms_categories);
        }

        // GET: /Admin/CMS_Category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            cms_Categories cms_categories = db.cms_Categories.Find(id);
            if (cms_categories == null)
            {
                return HttpNotFound();
            }
            return View(cms_categories);
        }

        // POST: /Admin/CMS_Category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,ParentId,Title,Description,Url,SortOrder,Status,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate")] cms_Categories cms_categories)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cms_categories).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cms_categories);
        }

        // GET: /Admin/CMS_Category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            cms_Categories cms_categories = db.cms_Categories.Find(id);
            if (cms_categories == null)
            {
                return HttpNotFound();
            }
            return View(cms_categories);
        }

        // POST: /Admin/CMS_Category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            cms_Categories cms_categories = db.cms_Categories.Find(id);
            db.cms_Categories.Remove(cms_categories);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
