using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using We7.CMS.Config;
using We7.Framework;
using We7.Framework.Config;
using We7.Framework.Util;
using System.Diagnostics;
using System.IO;
using System.Configuration;
using System.Collections.Generic;

namespace We7.CMS.Install
{
    /// <summary>
    /// insall 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://westengine.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class InstallWebService : System.Web.Services.WebService
    {
        //生成一个CredentialSoapHeader类的实例
        public MySoapHeader header;
               
        /// <summary>
        /// 初始化连接字符串
        /// </summary>
        /// <param name="setupDbType"></param>
        /// <param name="dbi"></param>
        /// <param name="ci"></param>
        /// <returns></returns>
        [WebMethod]
        [SoapHeader("header")] //用户身份验证的soap header
        public string InitDBConfig(string setupDbType,DatabaseInfo dbi)
        {
            //验证是否有权访问（当然，也可以通过查询数据库实现，具体视项目要求）
            if(!CheckAdmin(header.UserName,header.PassWord))
            {
                throw new Exception("无权使用此服务");
            }            

            string source = "We7.CMS.Install-InstallWebService-SetSiteConfig";
            try
            {
                BaseConfigInfo baseConfig = Installer.GenerateConnectionString(setupDbType, dbi);
                string file = Server.MapPath("~/config/db.config");
                BaseConfigs.SaveConfigTo(baseConfig, file);
                BaseConfigs.ResetConfig();
                if (dbi.CreateDB)
                {
                    Exception ex = null;
                    int ret = Installer.CreateDatabase(baseConfig, out ex);
                    if (ret == -1)
                    {
                        string msg = "数据库已存在，请重新命名或去掉重新“创建新数据库”前面的勾，使用已有数据库。";
                        Exception ex1 = new Exception(msg);
                        EventLogHelper.WriteToLog(source, ex1, EventLogEntryType.Error);
                        return msg;
                    }
                    else if (ret == 0)
                    {
                        string exceptionMsgs = ex.Message;
                        EventLogHelper.WriteToLog(source, ex, EventLogEntryType.Error);
                        return "创建数据库发生错误。错误原因：" + exceptionMsgs;
                    }
                }


                //设置数据库脚本路径
                //string basePath = Server.MapPath("/install/SQL");
                //if (!Directory.Exists(basePath))
                //{
                //    basePath = Server.MapPath("../install/SQL");
                //}
         

                if(!Directory.Exists(Server.MapPath("/_data/")))
                    Directory.CreateDirectory(Server.MapPath("/_data/"));
             

                List<string> files = new List<string>();
                files.Add("create.xml");
                files.Add("install.xml");
                files.Add("update.xml");
                Installer.ExcuteSQLGroup(baseConfig, files);
                
                //创建内容模型表
                Installer.CreateModelTables();
                ApplicationHelper.ResetApplication();

                return "0";
            }
            catch (Exception ex)
            {
                EventLogHelper.WriteToLog(source, ex, EventLogEntryType.Error);
                return "创建数据库发生错误。错误原因：" + ex.Message;
            }
        }

        [WebMethod]
        public string Ping()
        {
            try
            {
                return "Pong";
            }
            catch (Exception ex)
            {
                string source = "We7.CMS.Install-InstallWebService—Ping";
                EventLogHelper.WriteToLog(source, ex, EventLogEntryType.Error);
                throw ex;
            }
        }

        [WebMethod]
        [SoapHeader("header")] //用户身份验证的soap header
        public BaseConfigInfo GetBaseConfig()
        {
            //验证是否有权访问（当然，也可以通过查询数据库实现，具体视项目要求）
            if (!CheckAdmin(header.UserName, header.PassWord))
            {
                throw new Exception("无权使用此服务");
            }    
            try
            {
                return BaseConfigs.GetBaseConfig();
            }
            catch (Exception ex)
            {
                string source = "We7.CMS.Install-InstallWebService—GetBaseconfig";
                EventLogHelper.WriteToLog(source, ex, EventLogEntryType.Error);
                throw ex;
            }
        }

        [WebMethod]
        [SoapHeader("header")] //用户身份验证的soap header
        public string CopyTableDataFromCloneSite(string fromPath, string toPath, List<string> tables)
        {
            //验证是否有权访问（当然，也可以通过查询数据库实现，具体视项目要求）
            if (!CheckAdmin(header.UserName, header.PassWord))
            {
                throw new Exception("无权使用此服务");
            }   
            try
            {
                string xmlPath = Path.Combine(toPath, "App_Data\\XML");
                BaseConfigInfo oldConfig = BaseConfigs.Deserialize(Path.Combine(fromPath, "config\\db.config"));
                oldConfig.DBConnectionString = oldConfig.DBConnectionString.Replace("{$App}", fromPath);
                BaseConfigInfo newConfig = BaseConfigs.Deserialize(Path.Combine(toPath, "config\\db.config"));
                newConfig.DBConnectionString = newConfig.DBConnectionString.Replace("{$App}", toPath);
                DBMigrator.DoMigrate(xmlPath, oldConfig, newConfig, tables);
                return "0";
            }
            catch (Exception ex)
            {
                string source = "We7.CMS.Install-InstallWebService—CopyTableDataFromCloneSite";
                EventLogHelper.WriteToLog(source, ex);
                throw We7Helper.RaiseException("CopyTableDataFromCloneSite", ex.Message, "", ex.Source, We7Helper.FaultCode.Server);
            }
        }
        /// <summary>
        /// 检查登录
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        private bool CheckAdmin(string loginName, string password)
        {
            return String.Compare(loginName, SiteConfigs.GetConfig().AdministratorName, true) == 0 &&
          HelperFactory.Instance.GetHelper<SiteSettingHelper>().AdminPasswordIsValid(password);
        }
    }

}
