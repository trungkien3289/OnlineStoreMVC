using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OnlineStore.Model.Context;
using OnlineStore.Infractructure.Utility;
using OnlineStore.Service.Interfaces;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Implements;

namespace OnlineStoreMVC.Controllers
{
    public class BrandManagementController : Controller
    {
        private OnlineStoreMVCEntities db = new OnlineStoreMVCEntities();
        private IBrandManagementService service = new BrandManagementService();

        // GET: BrandManagement
        public ActionResult Index()
        {
            return View(db.Brands.ToList());
        }

        // GET: BrandManagement/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Brand brand = db.Brands.Find(id);
            DetailsBrandManagementView viewModel = service.GetDetailBrand((int)id);

            return View(viewModel);
        }

        // GET: BrandManagement/Create
        public ActionResult Create()
        {
            PopulateOrderDropDownList(null);
            return View();
        }

        // POST: BrandManagement/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,GUID,Status,SortOrder,Description")] Brand brand)
        {
            if (ModelState.IsValid)
            {
                db.Brands.Add(brand);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(brand);
        }

        // GET: BrandManagement/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Brand brand = db.Brands.Find(id);
            if (brand == null)
            {
                return HttpNotFound();
            }
            PopulateOrderDropDownList(brand.SortOrder);
            return View(brand);
        }

        // POST: BrandManagement/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Status,SortOrder,Description")] Brand brand)
        {
            if (ModelState.IsValid)
            {
                Brand selectedBrand = db.Brands.Find(brand.Id);
                selectedBrand.Status = brand.Status;
                selectedBrand.SortOrder = brand.SortOrder;
                selectedBrand.Description = brand.Description;
                db.Entry(selectedBrand).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(brand);
        }

        // GET: BrandManagement/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Brand brand = db.Brands.Find(id);
            if (brand == null)
            {
                return HttpNotFound();
            }
            return View(brand);
        }

        // POST: BrandManagement/Delete/5
        [HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Brand brand = db.Brands.Find(id);
            db.Brands.Remove(brand);
            db.SaveChanges();
            return Redirect("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private void PopulateOrderDropDownList(int? selectedOrder)
        {
            ViewBag.SortOrder = new SelectList(OrderPriorityHelper.getListOrderPriority(), "Value", "Name", selectedOrder);
        } 
    }
}
