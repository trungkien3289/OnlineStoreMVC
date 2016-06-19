using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OnlineStore.Model.Context;

namespace OnlineStoreMVC.Controllers
{
    public class ProductManagementController : Controller
    {
        private OnlineStoreMVCEntities db = new OnlineStoreMVCEntities();

        // GET: ProductManagement
        public ActionResult Index()
        {
            var productTitles = db.ProductTitles.Include(p => p.Brand).Include(p => p.Category);
            return View(productTitles.ToList());
        }

        // GET: ProductManagement/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductTitle productTitle = db.ProductTitles.Find(id);
            if (productTitle == null)
            {
                return HttpNotFound();
            }
            return View(productTitle);
        }

        // GET: ProductManagement/Create
        public ActionResult Create()
        {
            ViewBag.BrandId = new SelectList(db.Brands, "Id", "Name");
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name");
            return View();
        }

        // POST: ProductManagement/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ProductCode,Name,BrandId,CategoryId,Price,Quantity,Unit,CoverImageID,Description,Description2,TotalView,TotalBuy,Tags,Status")] ProductTitle productTitle)
        {
            if (ModelState.IsValid)
            {
                productTitle.GUID = new Guid();
                db.ProductTitles.Add(productTitle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BrandId = new SelectList(db.Brands, "Id", "Name", productTitle.BrandId);
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name", productTitle.CategoryId);
            return View(productTitle);
        }

        // GET: ProductManagement/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductTitle productTitle = db.ProductTitles.Find(id);
            if (productTitle == null)
            {
                return HttpNotFound();
            }
            ViewBag.BrandId = new SelectList(db.Brands, "Id", "Name", productTitle.BrandId);
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name", productTitle.CategoryId);
            return View(productTitle);
        }

        // POST: ProductManagement/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,GUID,ProductCode,Name,BrandId,CategoryId,Price,Quantity,Unit,CoverImageID,Description,Description2,TotalView,TotalBuy,Tags,IsNewProduct,IsBestSellProduct,SortOrder,Status,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate")] ProductTitle productTitle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productTitle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BrandId = new SelectList(db.Brands, "Id", "Name", productTitle.BrandId);
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name", productTitle.CategoryId);
            return View(productTitle);
        }

        // GET: ProductManagement/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductTitle productTitle = db.ProductTitles.Find(id);
            if (productTitle == null)
            {
                return HttpNotFound();
            }
            return View(productTitle);
        }

        // POST: ProductManagement/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductTitle productTitle = db.ProductTitles.Find(id);
            db.ProductTitles.Remove(productTitle);
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
