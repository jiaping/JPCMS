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
using We7.Model.Core.UI;
using We7.Framework.Util;
using We7.CMS.Accounts;
using We7.CMS;
using We7.Framework;

namespace We7.Model.UI.Controls.system
{
    public partial class ArticleID : FieldControl
    {
        /// <summary>
        /// 业务助手工厂
        /// </summary>
        protected HelperFactory HelperFactory
        {
            get
            {
                return HelperFactory.Instance;
            }
        }
        /// <summary>
        /// 文章类业务助手
        /// </summary>
        protected ArticleHelper ArticleHelper
        {
            get { return HelperFactory.GetHelper<ArticleHelper>(); }
        }

        /// <summary>
        /// 文章ID
        /// </summary>
        protected string CurrentArticleID
        {
            get
            {
                return ArticleHelper.GetArticleIDFromURL();
            }
        }
        public override void InitControl()
        {
        }

        public override object GetValue()
        {
            return CurrentArticleID;
        }
    }
}