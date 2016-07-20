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
