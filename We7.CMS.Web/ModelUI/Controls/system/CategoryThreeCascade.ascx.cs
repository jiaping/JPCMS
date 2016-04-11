using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using We7.Model.Core.UI;
using We7.Framework;
using We7.CMS;
using We7.CMS.Common;

namespace We7.Model.UI.Controls.system
{
    public partial class CategoryThreeCascade : FieldControl
    {
        public override void InitControl()
        {            
            string keyword = Control.Params["keyword"];
            CategoryHelper helper = HelperFactory.Instance.GetHelper<CategoryHelper>();
            List<Category> col = helper.GetChildrenListByKeyword(keyword);//二级

            Field1DropDownList.DataSource = col;
            Field1DropDownList.DataTextField = "Name";
            Field1DropDownList.DataValueField = "ID";
            Field1DropDownList.DataBind();
            Field1DropDownList.Items.Insert(0, new ListItem("请选择", ""));
            Field1DropDownList.SelectedValue = Value as string;

            Field1DropDownList.Attributes.Add("onchange", "getSubcate(this,1,'ID')");
            Field2DropDownList.Attributes.Add("onchange", "getSubcate(this,2,'KeyWord')");
            Field3DropDownList.Attributes.Add("onchange", "subcateChange('" + Field3DropDownList.ClientID + "',3)");


            //已有内容还原
            if(Value!=null)
            {
                string keywordSubcate =  Value.ToString();
                Field3Hidden.Value = keywordSubcate;                
                List<Category> colThreecates = helper.GetSiblingListByKeyword(keywordSubcate);

                if (colThreecates != null)
                {
                    Field3DropDownList.DataSource = colThreecates;
                    Field3DropDownList.DataTextField = "Name";
                    Field3DropDownList.DataValueField = "KeyWord";               
                    Field3DropDownList.DataBind();
                    Field3DropDownList.Items.Insert(0, new ListItem("请选择", ""));

                    Category parent = helper.GetCategory(colThreecates[0].ParentID);                   

                    List<Category> colTwoSubcates = helper.GetSiblingListByKeyword(parent.KeyWord);
                    Category parentOne = helper.GetCategory(colTwoSubcates[0].ParentID);

                    Field2DropDownList.DataSource = colTwoSubcates;
                    Field2DropDownList.DataTextField = "Name";
                    Field2DropDownList.DataValueField = "ID";
                    Field2DropDownList.DataBind();
                    Field2DropDownList.Items.Insert(0, new ListItem("请选择", ""));

                    //默认选中索引
                    int parentSelectIndex = colTwoSubcates.FindIndex(p => p.ID == parent.ID) + 1;//二级

                    int subSelectedIndex = colThreecates.FindIndex(p => p.KeyWord == keywordSubcate) + 1;//三级

                    int parentOneSelectIndex = col.FindIndex(p => p.ID == parentOne.ID) + 1; //一级

                    Field3DropDownList.SelectedIndex = subSelectedIndex;
                    Field2DropDownList.SelectedIndex = parentSelectIndex;
                    Field1DropDownList.SelectedIndex = parentOneSelectIndex;


                }
            }
        }

        public override object GetValue()
        {
            return Request.Form[Field3Hidden.UniqueID];
        }
    }
}