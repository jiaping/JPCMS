﻿using System;
using System.Collections.Generic;
using System.Data;
using We7.CMS.WebControls.Core;
using We7.Model.Core.Data;
using Thinkment.Data;
using We7.CMS.Common;
using We7.Model.Core;
using We7.CMS.Data;
using We7.Model.Core.UI;

namespace We7.CMS.UI.Widget
{
	[ControlGroupDescription(Label = "内容模型列表部件", Description = "内容模型列表部件", Icon = "内容模型部件", DefaultType = "WidgetList.Generate")]
	[ControlDescription(Desc = "内容模型列表部件(自动生成)")]
	public class WidgetList : BaseWidgetList
	{

		private int pageSize = 10;
		[Parameter(Title = "页记录数", Type = "Number", Required = true, DefaultValue = "10")]
		public int PageSize
		{
			get { return pageSize; }
			set { pageSize = value; }
		}
		protected override void OnInitData()
		{
			Criteria c = CreateCriteria();
			List<Order> os = CreateOrders();

			ModelDBHelper dbhelper = ModelDBHelper.Create(ModelName);
			// Items = dbhelper.QueryPagedList(c, os, 0, PageSize).Rows;
			DataTable dt = dbhelper.QueryPagedList(c, os, 0, PageSize, Fields);
			/*begin 表关联相关*/
			if (null != dt)
			{
				JoinEx joinex = new JoinEx();
				MoldPanel mp = new MoldPanel();
				ColumnInfoCollection columns = mp.GetPanelContext(ModelName, "list").Panel.ListInfo.Groups[0].Columns;
				foreach (ColumnInfo item in columns)
				{
					if (!string.IsNullOrEmpty(item.Params["model"]))
					{
						joinex.JoinInfo.Add(item.Name, new JoinEx() { MainField = item.Name, PriMaryKeyName = item.Params["valuefield"], ToField = item.Params["textfield"], ToTableName = item.Params["model"] });
					}
				}
				if (joinex.JoinInfo != null && joinex.JoinInfo.Count > 0)
				{
					DataBaseAssistant db = new DataBaseAssistant();
					dt = db.Join(dt, joinex);
				}
			}

			/*end*/
			if (dt != null) Items = dt.Rows;
		}

		protected override Criteria CreateCriteria()
		{
			Criteria c = new Criteria();
			if (QueryByColumn) //按栏目查询
			{
				if (String.IsNullOrEmpty(OwnerID))
				{
					OwnerID = ChannelHelper.GetChannelIDFromURL();
				}
				if (IncludeChildren) //按子栏目查询
				{
					Criteria subC = new Criteria();
					subC.Mode = CriteriaMode.Or;
					subC.Add(CriteriaType.Equals, "OwnerID", OwnerID);

					List<Channel> chs = ChannelHelper.GetChannels(OwnerID);
					if (chs != null && chs.Count > 0)
					{
						foreach (Channel ch in chs)
						{
							c.AddOr(CriteriaType.Equals, "OwnerID", ch.ID);
						}
					}
				}
				else
				{
					c.Add(CriteriaType.Equals, "OwnerID", OwnerID);
				}
			}

			if (ShowAtHome) //只显示置顶信息
			{
				c.Add(CriteriaType.Equals, "IsShow", 1);
			}

			if (!String.IsNullOrEmpty(Tag)) //按标签查询
			{
				c.Add(CriteriaType.Like, "Tags", "%" + Tag + "%");
			}
			c.Add(CriteriaType.Equals, "State", 1); //只显示状态为可用的数据
			ProcessQueryParam(c); //处理附加查询数据

			return c;
		}



	}


}
