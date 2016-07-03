using OnlineStore.Model.Context;
using OnlineStore.Model.MessageModel;
using OnlineStore.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Service.Interfaces
{
    public interface IProductService
    {
         IEnumerable<ProductSummaryViewModel> GetListProducts();
         IEnumerable<ProductSummaryViewModel> GetProducts(int pageNumber, int pageSize, out int totalItems);
        /// <summary>
        /// Get list brand using for create brand dropdownlist to let user choose brand for product 
        /// </summary>
        /// <returns></returns>
         IEnumerable<ecom_Brands> GetListBrand();
        /// <summary>
        /// Add new image to database
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
         Nullable<int> AddImage(share_Images image);
        /// <summary>
        /// Add new product to database
        /// </summary>
        /// <param name="newProduct"></param>
        /// <returns></returns>
         bool AddProduct(CreateProductPostRequest newProduct);
        /// <summary>
        /// Add image for exist product 
        /// </summary>
        /// <param name="IdProduct">product id</param>
        /// <param name="photo">new image</param>
         /// <param name="listImages"> return list image after adding finish</param>
         /// <returns>return true if action is success or false action is fail</returns>
         bool AddImageForProduct(int IdProduct, share_Images photo, out IEnumerable<share_Images> listImages);
        /// <summary>
        /// Update product
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        bool UpdateProduct(ProductFullView product);
        /// <summary>
        /// Get product by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        ecom_Products GetProductById(int id);
        /// <summary>
        /// Delete image in product
        /// </summary>
        /// <param name="productId">product id</param>
        /// <param name="imageId">id of image need to delete</param>
        /// <param name="listImages">list images of product after do action</param>
        /// <param name="imagePath">path of deteled image(using for delete image in folder)</param>
        /// <returns>return true if action is success or false if action is fail</returns>
        bool DeleteImage(int productId,int imageId, out IEnumerable<share_Images> listImages,out string imagePath);
        /// <summary>
        /// Delete product (set status is Delete)
        /// </summary>
        /// <param name="?"></param>
        /// <returns></returns>
        bool DeleteProduct(int id);
        //DetailCategoryViewModel GetDetailCategory(int id);
        //bool AddCategory(CreateCategoryPostRequest category);
        //bool UpdateCategory(CategoryViewModel category);
        //bool DeleteCategory(int id);
    }
}
