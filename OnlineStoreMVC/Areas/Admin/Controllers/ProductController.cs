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
using PagedList;
using OnlineStore.Model.Repository;
using OnlineStore.Model.MessageModel;
using OnlineStoreMVC.Utility;
using System.IO;
using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.Mapper;

namespace OnlineStoreMVC.Areas.Admin.Controllers
{
    public class ProductController : BaseManagementController
    {
        private OnlineStoreMVCEntities db = new OnlineStoreMVCEntities();
        private IProductService service = new ProductService();
        // GET: Admin/Product
        public ActionResult Index(string keyword, int page = 1)
        {
            int totalItems = 0;
            var products = service.GetProducts(page, OnlineStore.Infractructure.Utility.Define.PAGE_SIZE, out totalItems);

            IPagedList<ProductSummaryViewModel> pageProducts = new StaticPagedList<ProductSummaryViewModel>(products, page, OnlineStore.Infractructure.Utility.Define.PAGE_SIZE, totalItems);
            return View(pageProducts);
        }

        // GET: Admin/Product/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ecom_Products ecom_Products = db.ecom_Products.Find(id);
            if (ecom_Products == null)
            {
                return HttpNotFound();
            }
            return View(ecom_Products);
        }

        // GET: Admin/Product/Create
        public ActionResult Create()
        {
            PopulateStatusDropDownList();
            ViewBag.BrandId = PopulateListBrand();
            return View();
        }

        // POST: Admin/Product/Create
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(CreateProductPostRequest productRequest)
        {
            if (ModelState.IsValid)
            {
                var file = Request.Files["coverImage"];
                //HttpPostedFileBase file = coverImage;
                if (file != null && file.ContentLength > 0)
                {
                    if (file.ContentLength > 0)
                    {
                        // width + height will force size, care for distortion
                        //Exmaple: ImageUpload imageUpload = new ImageUpload { Width = 800, Height = 700 };

                        // height will increase the width proportionally
                        //Example: ImageUpload imageUpload = new ImageUpload { Height= 600 };

                        // width will increase the height proportionally
                        ImageUpload imageUpload = new ImageUpload { Width = 600 };

                        // rename, resize, and upload
                        //return object that contains {bool Success,string ErrorMessage,string ImageName}
                        ImageResult imageResult = imageUpload.RenameUploadFile(file);
                        if (imageResult.Success)
                        {
                            // Add new image to database
                            var photo = new share_Images
                            {
                                ImageName = imageResult.ImageName,
                                ImagePath = Path.Combine(ImageUpload.LoadPath, imageResult.ImageName)
                            };
                            var imageId = service.AddImage(photo);
                            // Add product
                            productRequest.CoverImageId = imageId;
                            service.AddProduct(productRequest);
                            return RedirectToAction("Index");
                        }
                        else
                        {
                            // use imageResult.ErrorMessage to show the error
                            ViewBag.Error = imageResult.ErrorMessage;
                        }
                    }
                }

            }
            PopulateStatusDropDownList();
            ViewBag.BrandId = PopulateListBrand(productRequest.BrandId);
            return View(productRequest);
        }

        // GET: Admin/Product/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ecom_Products product = service.GetProductById((int)id);
            if (product == null)
            {
                return HttpNotFound();
            }
            if (product.Status != null)
            {
                var status = (Define.Status)product.Status;
                PopulateStatusDropDownList(status);
            }
            else
            {
                PopulateStatusDropDownList();
            }
            ViewBag.BrandId = PopulateListBrand(product.BrandId);
            return View(product.ConvertToProductFullView());
        }

        // POST: Admin/Product/Edit/5
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(ProductFullView product)
        {
            if (ModelState.IsValid)
            {
                bool isSuccess = service.UpdateProduct(product);
                if (isSuccess)
                {
                    return RedirectToAction("Index");
                }
            }
            if (product.Status != null)
            {
                var status = (Define.Status)product.Status;
                PopulateStatusDropDownList(status);
            }
            else
            {
                PopulateStatusDropDownList();
            }
            ViewBag.BrandId = PopulateListBrand(product.BrandId);
            return View(product);
        }

        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult UploadImage(IEnumerable<HttpPostedFileBase> files, int? IdProduct)
        {
            if (IdProduct == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IEnumerable<share_Images> listImages = new List<share_Images>();
            if (files != null)
            {

                foreach (HttpPostedFileBase file in files)
                {
                    if (file.ContentLength > 0)
                    {
                        ImageUpload imageUpload = new ImageUpload { Width = 600 };
                        ImageResult imageResult = imageUpload.RenameUploadFile(file);
                        if (imageResult.Success)
                        {
                            share_Images photo = new share_Images
                            {
                                ImageName = imageResult.ImageName,
                                ImagePath = Path.Combine(ImageUpload.LoadPath, imageResult.ImageName)
                            };

                            service.AddImageForProduct((int)IdProduct, photo, out listImages);
                        }
                        else
                        {
                            // use imageResult.ErrorMessage to show the error
                            ViewBag.Error = imageResult.ErrorMessage;
                        }
                    }

                }
            }

            LoadListImageProductPartialViewModels listImageViewModels = new LoadListImageProductPartialViewModels()
            {
                ProductId = (int)IdProduct,
                Images = listImages
            };
            return PartialView("LoadListImageProduct", listImageViewModels);
        }

        /// <summary>
        /// Remove a image from list images of product
        /// </summary>
        /// <param name="Id">product Id</param>
        /// <returns>updated view of Cart</returns>
        public ActionResult DeleteImage(int productId, int imageId)
        {
            try
            {
                IEnumerable<share_Images> listImages = new List<share_Images>();
                string imagePath = "";
                bool isSuccess = service.DeleteImage(productId, imageId, out listImages, out imagePath);
                if (isSuccess)
                {
                    DeleteImageInFolder(imagePath);
                }
                else
                {
                    ViewBag.Error = "Error when delete image";
                }

                LoadListImageProductPartialViewModels listImageViewModels = new LoadListImageProductPartialViewModels()
                {
                    ProductId = productId,
                    Images = listImages
                };
                return PartialView("LoadListImageProduct", listImageViewModels);
            }
            catch (Exception ex)
            {
                return HttpNotFound();
            }
        }

        private bool DeleteImageInFolder(string path)
        {

            string filePath = Server.MapPath("~/" + path);
            if (System.IO.File.Exists(filePath))
            {
                try
                {
                    System.IO.File.Delete(filePath);
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
            return true;
        }

        // POST: Admin/Product/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            bool isSuccess = service.DeleteProduct(id);
            if (!isSuccess)
            {
                ModelState.AddModelError("ServerError", "Delete product fail!");
            }
             
            return RedirectToAction("Index");
        }

        public IEnumerable<SelectListItem> PopulateListBrand(int? selectedBrandId = null)
        {
            IEnumerable<ecom_Brands> brands = service.GetListBrand();

            IEnumerable<SelectListItem> listBrands = brands.Select(b => new SelectListItem()
            {
                Text = b.Name,
                Value = b.Id.ToString(),
                Selected = b.Id == selectedBrandId
            });

            return listBrands;
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
