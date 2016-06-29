using OnlineStore.Model.Context;
using OnlineStore.Model.Repository;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineStore.Model.Mapper;

namespace OnlineStore.Service.Implements
{
    public class CMSNewsService : ICMSNewsService
    {
        public IList<CMSNewsView> GetCMSNews(int pageNumber, int pageSize, out int totalItems)
        {
            using (var db = new OnlineStoreMVCEntities())
            {
                totalItems = db.cms_News.Count(x => x.Status != (int)OnlineStore.Infractructure.Utility.Define.Status.Delete);

                return db.cms_News.Where(x => x.Status != (int)OnlineStore.Infractructure.Utility.Define.Status.Delete)
                    .OrderByDescending(x => x.SortOrder).ThenByDescending(x => x.CreatedDate)
                    .Skip(pageSize * (pageNumber - 1)).Take(pageSize)
                    .Select(x => new CMSNewsView
                    {
                        Id = x.Id,
                        CategoryId = x.CategoryId,
                        CategoryTitle = x.cms_Categories.Title,
                        Title = x.Title,
                        SubTitle = x.SubTitle,
                        ContentNews = x.ContentNews,
                        Authors = x.Authors,
                        Tags = x.Tags,
                        TotalView = x.TotalView,
                        Status = x.Status
                    }).ToList();
            }
        }

        public bool AddCMSNews(CMSNewsView cmsNewsView)
        {
            try
            {
                using (var db = new OnlineStoreMVCEntities())
                {
                    var cmsNews = new cms_News
                    {
                        CategoryId = cmsNewsView.CategoryId,
                        Title = cmsNewsView.Title,
                        SubTitle = cmsNewsView.SubTitle,
                        ContentNews = cmsNewsView.ContentNews,
                        Authors = cmsNewsView.Authors,
                        Tags = cmsNewsView.Tags,
                        TotalView = cmsNewsView.TotalView,
                        Status = (int)OnlineStore.Infractructure.Utility.Define.Status.Active,
                        SortOrder = cmsNewsView.SortOrder,
                        CreatedDate = DateTime.Now,
                        ModifiedDate = DateTime.Now
                    };
                    db.cms_News.Add(cmsNews);
                    db.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool EditCMSNews(CMSNewsView cmsNewsView)
        {
            try
            {
                using (var db = new OnlineStoreMVCEntities())
                {
                    var news = db.cms_News.Find(cmsNewsView.Id);
                    news.CategoryId = cmsNewsView.CategoryId;
                    news.Title = cmsNewsView.Title;
                    news.SubTitle = cmsNewsView.SubTitle;
                    news.ContentNews = cmsNewsView.ContentNews;
                    news.Authors = cmsNewsView.Authors;
                    news.Tags = cmsNewsView.Tags;
                    news.TotalView = cmsNewsView.TotalView;
                    news.SortOrder = cmsNewsView.SortOrder;
                    news.ModifiedDate = DateTime.Now;
                    db.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public CMSNewsView GetCMSNewsById(int? newsId)
        {
            if (newsId == null)
                return null;

            using (var db = new OnlineStoreMVCEntities())
            {
                var news = db.cms_News.Find(newsId.Value);
                return new CMSNewsView
                {
                    Id = news.Id,
                    CategoryId = news.CategoryId,
                    Title = news.Title,
                    SubTitle = news.SubTitle,
                    ContentNews = news.ContentNews,
                    Authors = news.Authors,
                    Tags = news.Tags,
                    TotalView = news.TotalView,
                    Status = news.Status,
                    SortOrder = news.SortOrder
                };
            }
        }

        public bool DeleteCMSNews(int id)
        {
            try
            {
                using (var db = new OnlineStoreMVCEntities())
                {
                    var news = db.cms_News.Find(id);
                    news.Status = (int)OnlineStore.Infractructure.Utility.Define.Status.Delete;
                    db.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
