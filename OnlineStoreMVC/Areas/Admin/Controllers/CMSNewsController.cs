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
using PagedList;
using OnlineStore.Model.ViewModel;

namespace OnlineStoreMVC.Areas.Admin.Controllers
{
    public class CMSNewsController : Controller
    {
        private ICMSNewsService _cmsNewsService = new CMSNewsService();
        private ICMSCategoryService _cmsCategoryService = new CMSCategoryService();

        [NonAction]
        protected virtual List<SelectListItem> PrepareAllCategoriesModel(int selectedItemId = 0)
        {
            var availableCategories = new List<SelectListItem>();
            int totalItems = 0;
            var categories = _cmsCategoryService.GetCMSCategories(1, int.MaxValue, out totalItems);
            foreach (var c in categories)
            {
                if (c.Id != selectedItemId)
                {
                    availableCategories.Add(new SelectListItem
                    {
                        Text = CMSCategoryExtensions.GetFormattedBreadCrumb(c, categories),
                        Value = c.Id.ToString()
                    });
                }
            }

            return availableCategories;
        }

        // GET: /Admin/CMSNews/
        public ActionResult Index(string keyword, int page = 1)
        {
            int totalItems = 0;
            var categories = _cmsNewsService.GetCMSNews(page, OnlineStore.Infractructure.Utility.Define.PAGE_SIZE, out totalItems);

            IPagedList<CMSNewsView> pageNews = new StaticPagedList<CMSNewsView>(categories, page, OnlineStore.Infractructure.Utility.Define.PAGE_SIZE, totalItems);
            return View(pageNews);
        }

        // GET: /Admin/CMSNews/Create
        public ActionResult Create()
        {
            ViewBag.AvailableCategories = PrepareAllCategoriesModel();
            return View();
        }

        // POST: /Admin/CMSNews/Create
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CMSNewsView model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _cmsNewsService.AddCMSNews(model);

                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }
            }

            ViewBag.AvailableCategories = PrepareAllCategoriesModel();
            return View(model);
        }

        // GET: /Admin/CMSNews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var news = _cmsNewsService.GetCMSNewsById(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            ViewBag.AvailableCategories = PrepareAllCategoriesModel(id.Value);
            return View(news);
        }

        // POST: /Admin/CMSNews/Edit/5
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CMSNewsView model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _cmsNewsService.EditCMSNews(model);

                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }
            }

            ViewBag.AvailableCategories = PrepareAllCategoriesModel(model.Id);
            return View(model);
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            try
            {
                _cmsNewsService.DeleteCMSNews(id);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
            }

            return View();
        }
    }
}
