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
using OnlineStore.Model.MessageModel;
using OnlineStore.Model.Mapper;
using OnlineStore.Infractructure.Helper;
using PagedList;

namespace OnlineStoreMVC.Areas.Admin.Controllers
{
    public class BrandController : BaseManagementController
    {
        private IBrandManagementService service = new BrandManagementService();
        private OnlineStoreMVCEntities db = new OnlineStoreMVCEntities();

        // GET: Admin/Brand
        public ActionResult Index(string keyword, int page = 1)
        {
            int totalItems = 0;
            var brands = service.GetBrands(page, OnlineStore.Infractructure.Utility.Define.PAGE_SIZE, out totalItems);

            IPagedList<ecom_Brands> pageBrands = new StaticPagedList<ecom_Brands>(brands, page, OnlineStore.Infractructure.Utility.Define.PAGE_SIZE, totalItems);
            return View(pageBrands);
        }

        // GET: Admin/Brand/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetailsBrandManagementView viewModel = service.GetDetailBrand((int)id);
            if (viewModel == null)
            {
                return HttpNotFound();
            }
            return View(viewModel);
        }

        // GET: Admin/Brand/Create
        public ActionResult Create()
        {
            PopulateStatusDropDownList();
            return View();
        }

        // POST: Admin/Brand/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create(CreateBrandPostRequest brand)
        {
            if (ModelState.IsValid)
            {
                bool isSuccess = service.AddBrand(brand.ConvertToBrandModel());
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

        // GET: Admin/Brand/Edit/5
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
            PopulateStatusDropDownList((Define.Status)brand.Status);
            return View(brand.ConvertToEditBrandManagementGetResponse());
        }

        // POST: Admin/Brand/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit(EditBrandManagementPostRequest brand)
        {
            if (ModelState.IsValid)
            {
                bool isSuccess = service.UpdateBrand(brand.ConvertToBrandModel());
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

        // POST: Admin/Brand/Delete/5
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
