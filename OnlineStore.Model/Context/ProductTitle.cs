//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineStore.Model.Context
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductTitle
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductTitle()
        {
            this.Products = new HashSet<Product>();
            this.share_Images = new HashSet<share_Images>();
        }
    
        public int Id { get; set; }
        public System.Guid GUID { get; set; }
        public string ProductCode { get; set; }
        public string Name { get; set; }
        public int BrandId { get; set; }
        public int CategoryId { get; set; }
        public decimal Price { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<int> Unit { get; set; }
        public Nullable<int> CoverImageID { get; set; }
        public string Description { get; set; }
        public string Description2 { get; set; }
        public Nullable<int> TotalView { get; set; }
        public Nullable<int> TotalBuy { get; set; }
        public string Tags { get; set; }
        public bool IsNewProduct { get; set; }
        public bool IsBestSellProduct { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public Nullable<int> Status { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
    
        public virtual Brand Brand { get; set; }
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Products { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<share_Images> share_Images { get; set; }
    }
}