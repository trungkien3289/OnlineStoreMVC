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
using OnlineStore.Model.ViewModel;
using OnlineStore.Infractructure.Helper;

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

        /// <summary>
        /// Genarate request object to get list matched products from service
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Get ProductView contain list product of selected category
        /// </summary>
        /// <param name="id">id of category</param>
        /// <returns></returns>
        public ActionResult GetProductByCategory(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GetProductsByCategoryRequest request = CreateInitialProductSearchRequest((int)id);
            GetProductsByCategoryResponse response = service.GetProductsByCategory(request);
            PopulateStatusDropDownList();
            return View("DisplayProducts",response);
        }

        /// <summary>
        /// Get list product matched conditions
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetProductsByAjax(GetProductsByCategoryRequest request)
        {
            GetProductsByCategoryRequest productSearchRequest = GenarateProductSeachRequest(request);
            GetProductsByCategoryResponse response = service.GetProductsByCategory(productSearchRequest);
            return Json(response);
            //return new ActionResult()
            
            //new GetProductsByAjaxResponse()
            //{
            //    Success = true,
            //    ListProductView = View("ListProduct", response.Products),
            //    Model = response
            //};
        }

        /// <summary>
        /// Get details of selected product
        /// </summary>
        /// <param name="id">id of product</param>
        /// <returns></returns>
        public ActionResult ProductDetails(int? id)
        {
            if(id == null){
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            ProductDetailsView product = service.GetProductDetails((int)id);

            return View("ProductDetails", product);
        }

        /// <summary>
        /// Create SelectList sort product options using for dropdownlist
        /// </summary>
        /// <param name="option">selected option</param>
        /// <returns></returns>
        private void PopulateStatusDropDownList(ProductsSortBy option = ProductsSortBy.ProductNameAToZ)
        {
            IEnumerable<ProductsSortBy> values = Enum.GetValues(typeof(ProductsSortBy)).Cast<ProductsSortBy>();
            IEnumerable<SelectListItem> items = from value in values
                                                select new SelectListItem
                                                {
                                                    Text = EnumHelper.GetDescriptionFromEnum((ProductsSortBy)value),
                                                    Value = ((int)value).ToString(),
                                                    Selected = value == option,
                                                };

            ViewBag.SortProductOptionsSelectListItems = items;
        }
    }
}