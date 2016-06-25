using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OnlineStore.Model.Context;
using OnlineStore.Infractructure.Helper;
using OnlineStore.Service.Interfaces;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Implements;

namespace OnlineStoreMVC.Controllers
{
    public class BrandManagementController : Controller
    {
        private IBrandManagementService service = new BrandManagementService();

        // GET: BrandManagement
        public ActionResult Index()
        {
            return View(service.GetAllBrands());
        }

        // GET: BrandManagement/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetailsBrandManagementView viewModel = service.GetDetailBrand((int)id);

            return View(viewModel);
        }

        // GET: BrandManagement/Create
        public ActionResult Create()
        {
            //PopulateOrderDropDownList(null);
            return View();
        }

        // POST: BrandManagement/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Status,Description")] ecom_Brands brand)
        {
            if (ModelState.IsValid)
            {
                bool isSuccess = service.AddBrand(brand);
                if (isSuccess)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("ServerError", "Add new brand fail!");
                }
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
            ecom_Brands brand = service.GetBrandById((int)id);
            if (brand == null)
            {
                return HttpNotFound();
            }
            //PopulateOrderDropDownList(brand.SortOrder);
            return View(brand);
        }

        // POST: BrandManagement/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Status,Description")] ecom_Brands brand)
        {
            if (ModelState.IsValid)
            {
                bool isSuccess = service.UpdateBrand(brand);
                if (isSuccess)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("ServerError", "Update brand fail!");
                }
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
            ecom_Brands brand = service.GetBrandById((int)id);
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
            bool isSuccess = service.DeleteBrand(id);
            if (!isSuccess)
            {
                ModelState.AddModelError("ServerError", "Delete brand fail!");
            }
            return Redirect("Index");
        }

        //private void PopulateOrderDropDownList(int? selectedOrder)
        //{
        //    ViewBag.SortOrder = new SelectList(OrderPriorityHelper.getListOrderPriority(), "Value", "Name", selectedOrder);
        //} 
    }
}
