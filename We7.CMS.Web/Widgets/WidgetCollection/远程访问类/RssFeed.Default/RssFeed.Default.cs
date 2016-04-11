using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using We7.CMS.Common;
using System.Collections.Generic;
using We7.Framework;
using We7.CMS.WebControls;
using Thinkment.Data;
using We7.CMS.WebControls.Core;

namespace We7.CMS.Web.Widgets
{
    /// <summary>
    /// RSS文章订阅提供者
    /// </summary>
    [ControlGroupDescription(Label = "Rss订阅新闻", Icon = "Rss订阅新闻", Description = "Rss订阅新闻", DefaultType = "RssFeed.Default")]
    [ControlDescription(Name = "Rss订阅新闻", Desc = "Rss订阅新闻")]
    public partial class RssFeed_Default : ThinkmentDataControl
    {
        private List<Article> articles;
        private Channel channel;
        private Article picArticle;

        /// <summary>
        /// Rss地址
        /// </summary>
        [Parameter(Title = "Rss地址", Type = "String", Required = true, DefaultValue = "http://rss.sina.com.cn/news/marquee/ddt.xml")]
        public string RssUrl;

        /// <summary>
        /// 版块名称
        /// </summary>
        [Parameter(Title = "版块名称", Type = "String", Required = true, DefaultValue = "新浪新闻")]
        public string PageTitle;

        /// <summary>
        /// 显示记录条数
        /// </summary>
        [Parameter(Title = "控件每页记录", Type = "Number", DefaultValue="10")]
        public int PageSize = 10;

        /// <summary>
        /// 标题长度
        /// </summary>
        [Parameter(Title = "标题长度", Type = "Number",DefaultValue="30")]
        public int TitleLength = 30;

        /// <summary>
        /// 日期格式
        /// </summary>
        [Parameter(Title = "日期格式", Type = "String",DefaultValue="[MM-dd]")]
        public string DateFormat = "[MM-dd]";      

        /// <summary>
        /// 上边距10像素
        /// </summary>
        [Parameter(Title = "上边距10像素", Type = "Boolean", DefaultValue="1")]
        public bool MarginTop10;

        /// <summary>
        /// 下边距10像素
        /// </summary>
        [Parameter(Title = "左边距10像素", Type = "Boolean", DefaultValue="1")]
        public bool MarginLeft10;

        /// <summary>
        /// 自定义Css类名称
        /// </summary>
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "RssFeed_Default")]
        public string CssClass;

        /// <summary>
        /// 文章列表
        /// </summary>
        protected List<Article> Articles
        {
            get
            {
                if (articles == null)
                {
                    RssDataProvider rssProvider = new RssDataProvider();
                    rssProvider.PageSize = PageSize;                    
                    articles = rssProvider.ProcessRSSItem(RssUrl);                    
                }
                return articles;
            }
            set { articles = value; }
        }

        /// <summary>
        /// 附加的Css样式
        /// </summary>
        protected string MarginCss
        {
            get { return (MarginTop10 ? " mtop10" : "") + (MarginLeft10 ? " mleft10" : ""); }
        }

        protected override void OnDesigning()
        {
            Articles = GetExampleData();
        }

        /// <summary>
        /// 得到例子数据
        /// </summary>
        /// <returns></returns>
        private List<Article> GetExampleData()
        {
            List<Article> lsResult = new List<Article>();
            for (int i = 0; i < PageSize; i++)
            {
                Article temp = new Article();
                temp.ID = We7Helper.CreateNewID();
                temp.Title = "测试新闻" + (i + 1);
                lsResult.Add(temp);
            }
            return lsResult;
        }
    }
}