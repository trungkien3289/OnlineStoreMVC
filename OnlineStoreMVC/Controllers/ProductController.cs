using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineStore.Service.Interfaces;
using OnlineStore.Service.Implements;
using OnlineStore.Service.Messaging;
using OnlineStore.Infractructure.Utility;
using System.Net;

namespace OnlineStoreMVC.Controllers
{
    public class ProductController : Controller
    {
        public IDisplayProductService service = new DisplayProductService();
        private static int productPerPage = 10;

        /// <summary>
        /// Genarate initial Request object to get list product after category
        /// </summary>
        /// <param name="categoryId">id of selected category</param>
        /// <returns></returns>
        private GetProductsByCategoryRequest CreateInitialProductSearchRequest(int categoryId)
        {
            GetProductsByCategoryRequest request = new GetProductsByCategoryRequest()
            {
                CategoryId = categoryId,
                Index = 1,
                NumberOfResultsPerPage = productPerPage,
                SortBy = ProductsSortBy.ProductNameAToZ
            };

            return request;
        } 

        private GetProductsByCategoryRequest GenarateProductSeachRequest(GetProductsByCategoryRequest request){
            GetProductsByCategoryRequest productSeachRequest = new GetProductsByCategoryRequest()
            {
                CategoryId = request.CategoryId,
                BrandIds = request.BrandIds,
                SortBy = request.SortBy,
                BeginPrice = request.BeginPrice,
                EndPrice = request.EndPrice,
                Index = request.Index,
                NumberOfResultsPerPage = productPerPage,
                SearchString = request.SearchString
            };

            return productSeachRequest;
        }

        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetProductByCategory(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GetProductsByCategoryRequest request = CreateInitialProductSearchRequest((int)id);
            GetProductsByCategoryResponse response = service.GetProductsByCategory(request);
            return View("DisplayProducts",response);
        }

        [HttpPost]
        public JsonResult GetProductsByAjax(GetProductsByCategoryRequest request)
        {
            GetProductsByCategoryRequest productSearchRequest = GenarateProductSeachRequest(request);
            GetProductsByCategoryResponse response = service.GetProductsByCategory(productSearchRequest);
            return Json(response);
        }
    }
}