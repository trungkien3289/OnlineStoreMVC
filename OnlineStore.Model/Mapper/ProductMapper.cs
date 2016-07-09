using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.Context;
using OnlineStore.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.Mapper
{
    public static class ProductMapper
    {
        public static ProductFullView ConvertToProductFullView(this ecom_Products product)
        {
            ProductFullView productFullView = new ProductFullView()
            {
                Id = product.Id,
                ProductCode = product.ProductCode,
                Name = product.Name,
                Price = product.Price,
                Quantity = product.Quantity,
                Unit = product.Unit,
                BrandId = product.BrandId,
                CoverImageId = product.CoverImageId,
                Description = product.Description,
                Description2 = product.Description2,
                TotalView = product.TotalView,
                TotalBuy = product.TotalBuy,
                Tags = product.Tags,
                IsNewProduct = product.IsNewProduct,
                IsBestSellProduct = product.IsBestSellProduct,
                SortOrder = product.SortOrder,
                Status = product.Status,
                //CreatedBy = product.CreatedBy.to,
                //CreatedDate = product.CreatedDate,
                //ModifiedBy = product.ModifiedBy,
                //ModifiedDate = product.ModifiedDate
                share_Images = product.share_Images.ConvertToImageProductViewModels()
            };

            return productFullView;
        }

        public static ImageProductViewModel ConvertToImageProductViewModel(this share_Images image)
        {
            ImageProductViewModel imageViewModel = new ImageProductViewModel()
            {
                Id = image.Id,
                ImageName = image.ImageName,
                ImagePath = image.ImagePath,
                IsActive = image.Status == (int)Define.Status.Active? true:false
            };

            return imageViewModel;
        }

        public static IEnumerable<ImageProductViewModel> ConvertToImageProductViewModels(this IEnumerable<share_Images> images)
        {
            IList<ImageProductViewModel> listImages = new List<ImageProductViewModel>();
            foreach (share_Images image in images)
            {
                listImages.Add(image.ConvertToImageProductViewModel());
            }

            return listImages;
        }
    }
}