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
using OnlineStore.Model.ViewModel;

namespace OnlineStoreMVC.Areas.Admin.Controllers
{
    public class ProfileController : Controller
    {
        private OnlineStoreMVCEntities db = new OnlineStoreMVCEntities();
        private IProfileService _profileService = new ProfileService();

        // GET: /Admin/Profile/
        public ActionResult Index(string keyword, int page = 1)
        {
            int totalItems = 0;
            var profiles = _profileService.GetProfiles(page, OnlineStore.Infractructure.Utility.Define.PAGE_SIZE, out totalItems);

            IPagedList<ProfileViewModel> pageProfiles = new StaticPagedList<ProfileViewModel>(profiles, page, OnlineStore.Infractructure.Utility.Define.PAGE_SIZE, totalItems);
            return View(pageProfiles);
        }

        // GET: /Admin/Profile/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            system_Profiles system_profiles = db.system_Profiles.Find(id);
            if (system_profiles == null)
            {
                return HttpNotFound();
            }
            return View(system_profiles);
        }

        // GET: /Admin/Profile/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/Profile/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="UserId,UserName,Emaill,Password,Phone,Address")] system_Profiles system_profiles)
        {
            if (ModelState.IsValid)
            {
                system_profiles.UserId = Guid.NewGuid();
                db.system_Profiles.Add(system_profiles);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(system_profiles);
        }

        // GET: /Admin/Profile/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            system_Profiles system_profiles = db.system_Profiles.Find(id);
            if (system_profiles == null)
            {
                return HttpNotFound();
            }
            return View(system_profiles);
        }

        // POST: /Admin/Profile/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="UserId,UserName,Emaill,Password,Phone,Address")] system_Profiles system_profiles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(system_profiles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(system_profiles);
        }

        [HttpDelete]
        public ActionResult Delete(Guid id)
        {
            _profileService.DeleteProfile(id);
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
