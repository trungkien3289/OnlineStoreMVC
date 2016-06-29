﻿using OnlineStore.Model.Context;
using OnlineStore.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Service.Interfaces
{
    public interface ICMSNewsService
    {
        IList<CMSNewsView> GetCMSNews(int pageNumber, int pageSize, out int totalItems);
        bool AddCMSNews(CMSNewsView cmsNewsView);
        bool EditCMSNews(CMSNewsView cmsNewsView);
        bool DeleteCMSNews(int id);
        CMSNewsView GetCMSNewsById(int? newsId);
    }
}
