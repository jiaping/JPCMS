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
using We7.Model.Core;

namespace We7.CMS.Web.Admin.Addins
{
	public partial class ModelListing : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string model = Request["model"];
			string panel = Request["panel"];
			if (String.IsNullOrEmpty(model))
			{
				Trace.Warn(String.Format("{0}::\r\n内容模型的model与panel为空!当前mode为{1},panel为{2}", DateTime.Now, model, panel));
			}


			ModelInfo info = ModelHelper.GetModelInfo(model);
			if (UseObsoleteList.Value.ToLower() == "true" || (info.Layout.Panels["list"].ListInfo.Groups.Count > 1 && info.Layout.Panels["list"].ListInfo.Groups[1].Enable))
			{
				Response.Redirect(ObsoleteList);
			}
			PagePathLiteral.Text = info.Label + "管理>" + info.Label + "列表";
			NameLabel.Text = info.Label + "管理";
		}
		public string ObsoleteList
		{
			get
			{
				return Request.RawUrl.ToLower().Replace("modellist.aspx", "modellistforobsolete.aspx");
			}
		}
	}
}
