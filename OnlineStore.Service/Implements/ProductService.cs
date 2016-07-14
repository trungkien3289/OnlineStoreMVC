﻿using OnlineStore.Model.Context;
using OnlineStore.Model.Repository;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineStore.Infractructure.Helper;
using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.MessageModel;
using System.Data.Entity;

namespace OnlineStore.Service.Implements
{
    public class ProductService : IProductService
    {
        #region properties

        private static OnlineStoreMVCEntities context = new OnlineStoreMVCEntities();
        private ProductRepository db = new ProductRepository(context);
        private BrandRepository brandRepository = new BrandRepository(context);
        private Repository<share_Images> imageRepository = new Repository<share_Images>(context);
        private CategoryRepository categoryRepository = new CategoryRepository(context);

        #endregion

        #region Functions
        public IEnumerable<ProductSummaryViewModel> GetListProducts()
        {
            IEnumerable<ProductSummaryViewModel> listProducts = db.GetAllProducts().Select(p => new ProductSummaryViewModel()
            {
                Id = p.Id,
                Name = p.Name,
                ProductCode = p.ProductCode,
                Price = p.Price,
                SortOrder = p.SortOrder,
                Status = EnumHelper.GetDescriptionFromEnum((Define.Status)p.Status),
                CoverImage = p.share_Images.FirstOrDefault()
            }).ToList();

            return listProducts;
        }

        /// <summary>
        /// Get list products with paging, sort, filter
        /// </summary>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalItems"></param>
        /// <returns></returns>
        public IEnumerable<ProductSummaryViewModel> GetProducts(int pageNumber, int pageSize, out int totalItems)
        {
            IEnumerable<ecom_Products> products = db.GetAllProductsWithoutDelete();
            totalItems = products.Count();
            IEnumerable<ProductSummaryViewModel> returnCategoryList = products.OrderBy(b => b.Name).Skip(pageSize * (pageNumber - 1)).Take(pageSize).Select(p => new ProductSummaryViewModel()
            {
                Id = p.Id,
                Name = p.Name,
                ProductCode = p.ProductCode,
                Price = p.Price,
                SortOrder = p.SortOrder,
                Status = EnumHelper.GetDescriptionFromEnum((Define.Status)p.Status),
                CoverImage = p.CoverImage
            }).ToList();
            return returnCategoryList;
        }

        /// <summary>
        /// Get list brand for create dropdownlist
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ecom_Brands> GetListBrand()
        {
            return brandRepository.GetAllAvailableBrands().Where(b => b.Status != (int)Define.Status.Delete).ToList();
        }

        /// <summary>
        /// Add new image to database
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        public Nullable<int> AddImage(share_Images image)
        {
            try{
                image.Status = (int)Define.Status.Active;
                imageRepository.Insert(image);
                imageRepository.Save();
                return image.Id;
            }catch(Exception ex){
                return null;
            }
        }

        /// <summary>
        /// Add new product to database
        /// </summary>
        /// <returns></returns>
        public bool AddProduct(CreateProductPostRequest newProduct)
        {
            try
            {
                ecom_Products product = new ecom_Products()
                {
                    ProductCode = newProduct.ProductCode,
                    Name = newProduct.Name,
                    Price = newProduct.Price,
                    Quantity = newProduct.Quantity,
                    Unit = newProduct.Unit,
                    BrandId = newProduct.BrandId,
                    CoverImageId = newProduct.CoverImageId,
                    Description = newProduct.Description,
                    Description2 = newProduct.Description2,
                    Tags = newProduct.Tags,
                    IsNewProduct = newProduct.IsNewProduct,
                    IsBestSellProduct = newProduct.IsBestSellProduct,
                    SortOrder = newProduct.SortOrder,
                    Status = newProduct.Status
                };

                share_Images coverImage = imageRepository.GetByID(newProduct.CoverImageId);
                product.share_Images.Add(coverImage);
                db.Insert(product);
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Add image for exist product 
        /// </summary>
        /// <param name="IdProduct">product id</param>
        /// <param name="photo">new image</param>
        /// <param name="listImages"> return list image after adding finish</param>
        /// <returns>return true if action is success or false action is fail</returns>
        public bool AddImageForProduct(int IdProduct, share_Images photo)
        {
            ecom_Products product = db.GetProductById(IdProduct);
            if (product == null)
            {
                return false;
            }
            else
            {
                product.share_Images.Add(photo);
                db.Save();
                return true;
            }
        }

        /// <summary>
        /// Update product
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        public bool UpdateProduct(ProductFullView productViewModel)
        {
            ecom_Products product = db.GetProductById(productViewModel.Id);
            if (product == null)
            {
                return false;
            }
            else
            {
                product.ProductCode = productViewModel.ProductCode;
                product.Name = productViewModel.Name;
                product.Price = productViewModel.Price;
                product.Quantity = productViewModel.Quantity;
                product.Unit = productViewModel.Unit;
                product.BrandId = productViewModel.BrandId;
                product.Description = productViewModel.Description;
                product.Description2 = productViewModel.Description2;
                product.Tags = productViewModel.Tags;
                product.IsNewProduct = productViewModel.IsNewProduct;
                product.IsBestSellProduct = productViewModel.IsBestSellProduct;
                product.SortOrder = productViewModel.SortOrder;
                product.Status = productViewModel.Status;

                if(productViewModel.CategoryId == null){
                    product.ecom_Categories = new List<ecom_Categories>();
                }else{
                    var selectedCategories = new HashSet<int>(productViewModel.CategoryId);
                    var categoriesProduct = new HashSet<int>(product.ecom_Categories.Select(c => c.Id));
                    foreach (var category in categoryRepository.GetAllCategories()){
                        if(selectedCategories.Contains(category.Id)){
                            if(!categoriesProduct.Contains(category.Id)){
                                product.ecom_Categories.Add(category);
                            }
                        }else{
                            if(categoriesProduct.Contains(category.Id)){
                                product.ecom_Categories.Remove(category);
                            }
                        }
                    }
                }

                db.Save();
                return true;
            }
        }
        public ecom_Products GetProductById(int id)
        {
            return db.GetProductById(id);
        }

        /// <summary>
        /// Delete image in product
        /// </summary>
        /// <param name="productId">product id</param>
        /// <param name="imageId">id of image need to delete</param>
        /// <param name="listImages">list images of product after do action</param>
        /// <param name="imagePath">path of deteled image(using for delete image in folder)</param>
        /// <returns>return true if action is success or false if action is fail</returns>
        public bool DeleteImage(int productId, int imageId, out string imagePath)
        {
            try
            {
                ecom_Products product = GetProductById(productId);
                share_Images image = product.share_Images.Where(i => i.Id == imageId).SingleOrDefault();
                //Delete image in product
                product.share_Images.Remove(image);
                db.Save();
                // Delete image in table share_images
                var deleteImage = imageRepository.GetByID(imageId);
                imagePath = deleteImage.ImagePath;
                imageRepository.Delete(deleteImage);
                imageRepository.Save();
                return true;
            }
            catch (Exception ex)
            {
                imagePath = null;
                return false;
            }
        }

        /// <summary>
        /// Delete product (set Status is Delete)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteProduct(int id)
        {
            try
            {
                ecom_Products product = GetProductById(id);
                product.Status = (int)Define.Status.Delete;
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            
        }

        /// <summary>
        /// Set as cover image of product
        /// </summary>
        /// <param name="productId"></param>
        /// <param name="imageId"></param>
        /// <param name="listImages"></param>
        /// <returns></returns>
        public bool SetAsCoverImage(int productId, int imageId)
        {
            try
            {
                ecom_Products product = GetProductById(productId);
                product.CoverImageId = imageId;
                db.Update(product);
                db.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// update image information of product
        /// </summary>
        /// <param name="productId">product id</param>
        /// <param name="image">image id</param>
        /// <param name="isCoverImage">is cover image of product or not</param>
        /// <param name="listImages">list images of product returned</param>
        /// <returns></returns>
        public bool UpdateProductImage(int productId, OnlineStore.Service.Messaging.UpdateProductImage imageInfor, bool isCoverImage)
        {
            try
            {
                share_Images image = imageRepository.GetByID(imageInfor.ImageId);
                image.ImageName = imageInfor.Name;
                image.Status = imageInfor.IsActive ? (int)Define.Status.Active : (int)Define.Status.Deactive;
                imageRepository.Update(image);
                imageRepository.Save();

                ecom_Products product = db.GetProductById(productId);
                if (isCoverImage)
                {
                    product.CoverImageId = image.Id;
                }
                else
                {
                    if (product.CoverImageId == image.Id)
                    {
                        product.CoverImageId = null;
                    }
                }
                db.Update(product);
                db.Save();
                
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Get all available category in system
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ecom_Categories> GetListCategory()
        {
            return categoryRepository.GetAllActiveCategory();
        }

        #endregion
    }
}