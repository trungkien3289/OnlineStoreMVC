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
    public class NewsController : Controller
    {
        private OnlineStoreMVCEntities db = new OnlineStoreMVCEntities();

        // GET: /News/
        public ActionResult Index()
        {
            var cms_news = db.cms_News.Include(c => c.cms_Categories).Include(c => c.share_Images);
            return View(cms_news.ToList());
        }

        // GET: /News/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            cms_News cms_news = db.cms_News.Find(id);
            if (cms_news == null)
            {
                return HttpNotFound();
            }
            return View(cms_news);
        }

        // GET: /News/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.cms_Categories, "Id", "Title");
            ViewBag.CoverImageId = new SelectList(db.share_Images, "Id", "ImageName");
            return View();
        }

        // POST: /News/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,CategoryId,CoverImageId,Title,SubTitle,ContentNews,Authors,Tags,TotalView,DisplayHomePage,SortOrder,Status,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate")] cms_News cms_news)
        {
            if (ModelState.IsValid)
            {
                db.cms_News.Add(cms_news);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.cms_Categories, "Id", "Title", cms_news.CategoryId);
            ViewBag.CoverImageId = new SelectList(db.share_Images, "Id", "ImageName", cms_news.CoverImageId);
            return View(cms_news);
        }

        // GET: /News/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            cms_News cms_news = db.cms_News.Find(id);
            if (cms_news == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.cms_Categories, "Id", "Title", cms_news.CategoryId);
            ViewBag.CoverImageId = new SelectList(db.share_Images, "Id", "ImageName", cms_news.CoverImageId);
            return View(cms_news);
        }

        // POST: /News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,CategoryId,CoverImageId,Title,SubTitle,ContentNews,Authors,Tags,TotalView,DisplayHomePage,SortOrder,Status,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate")] cms_News cms_news)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cms_news).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.cms_Categories, "Id", "Title", cms_news.CategoryId);
            ViewBag.CoverImageId = new SelectList(db.share_Images, "Id", "ImageName", cms_news.CoverImageId);
            return View(cms_news);
        }

        // GET: /News/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            cms_News cms_news = db.cms_News.Find(id);
            if (cms_news == null)
            {
                return HttpNotFound();
            }
            return View(cms_news);
        }

        // POST: /News/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            cms_News cms_news = db.cms_News.Find(id);
            db.cms_News.Remove(cms_news);
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
