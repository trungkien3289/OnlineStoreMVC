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
using OnlineStoreMVC.Utility;
using OnlineStore.Model.MessageModel;
using OnlineStore.Model.Mapper;
using OnlineStore.Infractructure.Helper;

namespace OnlineStoreMVC.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        private IBrandManagementService service = new BrandManagementService();
        private OnlineStoreMVCEntities db = new OnlineStoreMVCEntities();

        // GET: Admin/Brand
        public ActionResult Index()
        {
            return View(service.GetAllBrands());
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
        [ValidateAntiForgeryToken]
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

        // GET: Admin/Brand/Delete/5
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

        private void PopulateStatusDropDownList(Define.Status status = Define.Status.Active)
        {
            IEnumerable<Define.Status> values =

                    Enum.GetValues(typeof(Define.Status))

                    .Cast<Define.Status>();

            IEnumerable<SelectListItem> items =

                from value in values

                select new SelectListItem

                {

                    Text = EnumHelper.GetDescriptionFromEnum((Define.Status)value),

                    Value = value.ToString(),

                    Selected = value == status,

                };

            ViewBag.Status = items;
        }
    }
}
