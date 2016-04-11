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
using We7.Framework;
using System.Collections.Generic;
using We7.Framework;
using We7.CMS.WebControls;
using Thinkment.Data;
using We7.CMS.WebControls.Core;
using We7.CMS.Common;
using System.Text.RegularExpressions;
using System.Web.Services.Protocols;
using WebEngine2007.Services.AD;
using We7.Framework.Config;

namespace We7.CMS.Web.Widgets.ShopDownload
{
    [ControlGroupDescription(Label = "广告", Icon = "广告", Description = "广告", DefaultType = "AD.Simple")]
    [ControlDescription(Desc = "广告")]
    public partial class AD_Simple : BaseControl
    {
        protected HelperFactory HelperFactory
        {
            get
            {
                return We7.Framework.HelperFactory.Instance;
            }
        }
        [We7.CMS.WebControls.Core.ControlDescription(Desc = "广告插件", Author = "mxy")]
        string MetaData;


        /// <summary>
        /// 缩略图标签
        /// </summary>
        [Parameter(Title = "Tag标签", Type = "KeyValueSelector", Data = "adtag")]
        public string Tag = "";

        /// <summary>
        /// 自定义Css类名称
        /// </summary>
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "ArticleList_Default")]
        public string CssClass;

        public string JSPath
        {
            get
            {
                return GetJSPath();
            }
        }

        public SiteSettingHelper CDHelper
        {
            get { return HelperFactory.GetHelper<SiteSettingHelper>(); }
        }

        /// <summary>
        /// 获取ad服务
        /// </summary>
        /// <returns></returns>
        ADInterfaceService GetADService()
        {
            ADInterfaceService client = new ADInterfaceService();
            string url = HttpContext.Current.Request.Url.Host + ":" + HttpContext.Current.Request.Url.Port + "/Plugins/ADPlugin/UI/"; //SiteConfigs.GetConfig().ADUrl;
            if (url.Contains("/"))
            {
                client.Url = "http://" + url + "ADInterfaceService.asmx";
            }
            else
            {
                client.Url = "http://" + url + "/ADInterfaceService.asmx";
            }
            return client;
        }

        /// <summary>
        /// 获取广告位的JS文件路径
        /// </summary>
        /// <param name="siteID">站点ID</param>
        /// <param name="url">站点Url</param>
        /// <param name="tag">页面标签</param>
        /// <returns></returns>
        public string GetADZoneJSPath(string siteID, string url, string app, string tag)
        {
            try
            {
                ChannelHelper chHelper = HelperFactory.GetHelper<ChannelHelper>();
                url = url.ToLower();
                string chID = chHelper.GetChannelIDFromURL();
                string channelPath = chHelper.GetFullPath(chID);
                string pathType = "";

                //路径类型："*"首页与栏目；"*.html"内容页；"*.aspx"其他页
                if ((url.EndsWith("_") && !url.EndsWith("aspx_")) || url.EndsWith("_default.aspx") ||
                    url.EndsWith("_default.html") || url.EndsWith("_index.html"))
                {
                    pathType = "*";
                }

                if (url.EndsWith(".html") && !url.EndsWith("default.html"))
                {
                    pathType = "*.html";
                }

                if ((url.EndsWith(".aspx") && !url.EndsWith("default.aspx")) || url.EndsWith(".aspx_"))
                {
                    pathType = "*.aspx";
                    channelPath = "";//如果为其他页，则此路径为空
                }
                return GetADService().GetAdZoneJSPath(siteID, channelPath, pathType, tag);
            }
            catch (SoapException soapExt)
            {
                throw new Exception(We7Helper.SoapExceptionInfo(soapExt));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        string GetUrl()
        {
            string url = HttpContext.Current.Request.RawUrl;
            Regex reg = new Regex("[^?]*");
            Match m = reg.Match(url);
            return m != null && m.Success ? m.Value : String.Empty;
        }
        /// <summary>
        /// 获取当前控件所对应的广告JS
        /// </summary>
        /// <returns></returns>
        string GetJSPath()
        {

            //此处代码优化时注意改为单个页面只读一次
            string adZoneJSPath = "";
            try
            {
                bool enableCache = (CDHelper.Config.EnableCache == "true");
                string url = GetUrl();
                if (!String.IsNullOrEmpty(url))
                    url = url.Replace("/", "_");
                string result = null;
                if (enableCache)
                {
                    string key = string.Format("$ADCache${0}${1}", url, Tag);
                    result = AppCtx.Cache.RetrieveObject<string>(key);
                    if (String.IsNullOrEmpty(result))
                    {
                        string siteID = CDHelper.GetSiteID();
                        string app = Request.ApplicationPath;
                        adZoneJSPath = GetADZoneJSPath(siteID, url, app, Tag);
                        result = adZoneJSPath;
                        AppCtx.Cache.AddObject(key, result);
                    }
                }
                else
                {
                    string siteID = CDHelper.GetSiteID();
                    string app = Request.ApplicationPath;
                    adZoneJSPath = GetADZoneJSPath(siteID, url, app, Tag);
                    result = adZoneJSPath;
                }

                return result;
            }
            catch (Exception)
            {
            }
            return "";
        }
    }
}