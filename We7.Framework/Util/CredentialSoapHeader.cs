using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Services.Protocols;
using We7.Framework.Config;

namespace We7.Framework.Util
{
    #region 登录头配置

    public class MySoapHeader : SoapHeader
    {
        private string strUserName = string.Empty;
        private string strPassWord = string.Empty;

        #region 用户名与密码
        /// <summary>
        /// 用户名
        /// </summary>
        public string UserName
        {
            get { return strUserName; }
            set { strUserName = value; }
        }
        /// <summary>
        /// 密码
        /// </summary>
        public string PassWord
        {
            get { return strPassWord; }
            set { strPassWord = value; }
        }
        #endregion
    }
    #endregion
}
