using System;
using System.Collections.Generic;
using System.Text;
using We7.CMS.WebControls.Core;
using Thinkment.Data;
using We7.CMS.WebControls;
using We7.CMS.Common;
using We7.Framework.Util;

namespace We7.CMS.UI.Widget
{
	[ControlGroupDescription(Label = "反馈模型部件", Description = "自动生成的反馈模型部件", Icon = "反馈模型部件", DefaultType = "")]
	[ControlDescription(Desc = "反馈模型查询列表部件(自动生成)")]
	public class WidgetAdviceQueryList : WidgetAdviceList
	{
		/// <summary>
		/// 安全查询
		/// </summary>
		[Parameter(Title = "密码验证", Type = "Boolean", DefaultValue = "", Required = true)]
		public bool SecurityQuery;

		/// <summary>
		/// 
		/// </summary>
		public string ErrorMessage { get; set; }

		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				Pager.RecordCount = HelperFactory.Assistant.Count<AdviceInfo>(CreateListCriteria());
			}
		}
		Criteria c;
		protected override Criteria CreateListCriteria()
		{
			if (c == null)
			{
				c = new Criteria();
				if (!string.IsNullOrEmpty(AdviceType))
				{
					string modelName;
					try { modelName = new AdviceTypeHelper().GetAdviceType(AdviceType).ModelName; }
					catch { modelName = AdviceType; }
					c.Add(CriteriaType.Equals, "ModelName", modelName);
					c.Add(CriteriaType.Equals, "TypeID", AdviceTypeID);
				}
				if (!string.IsNullOrEmpty(Request[QueryKey]))
				{
					c.Add(CriteriaType.Equals, "SN", AdviceTypeID);
				}
				if (!string.IsNullOrEmpty(Request["KeyWord"]))
				{
					c.Add(CriteriaType.Like, "Title", "%" + Request["KeyWord"].Trim() + "%");
				}
				if (IsShow)
				{
					c.Add(CriteriaType.Equals, "IsShow", 1);
				}
				if (SecurityQuery)
				{
					c.Add(CriteriaType.Equals, "MyQueryPwd", Request["Password"]);
				}
			}
			return c;
		}
	}
}
