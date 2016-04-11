using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Web.UI.WebControls;
using We7.CMS.Common.PF;
using We7.CMS.Common;
using We7.CMS.Common.Enum;
using We7.Framework.Config;

namespace We7.CMS.Web.Admin.controls
{
    public partial class Advice_Authorize : BaseUserControl
    {
        /// <summary>
        /// 获取反馈模型ID
        /// </summary>
        public string AdviceTypeID
        {
            get
            {
                return Request["adviceTypeID"] != null ? We7Helper.FormatToGUID((string)Request["adviceTypeID"]) : Request["adviceTypeID"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                InitControls();
                LoadRoles();
                LoadUsers();
            }
        }

        protected void SaveButton_ServerClick(object sender, EventArgs e)
        {
            SaveObjectPermissions(RolesGridView, "role");
            SaveObjectPermissions(UsersGridView, "user");

            Messages.ShowMessage("模型权限已更新。");
        }

        void InitControls()
        {
            //SaveButton2.Attributes["onclick"] = "return AdviceBasicadviceTypeeck('" + this.ClientID + "');";
        }

        /// <summary>
        /// 在行数据绑定事件中，判断需要显示的字段
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RolesGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            BindPermisstionsData(e, "role");
        }
        protected void Pager_Fired(object sender, EventArgs e)
        {
            LoadRoles();
        }

        /// <summary>
        /// 加载角色
        /// </summary>
        void LoadRoles()
        {
            if (AdvicePager.Count < 0)
            {
                AdvicePager.PageIndex = 0;
            }
            AdvicePager.FreshMyself();
            List<Role> roleList = new List<Role>();
            string siteID = SiteConfigs.GetConfig().SiteGroupEnabled ? SiteConfigs.GetConfig().SiteID : string.Empty;
            AdvicePager.RecorderCount = AccountHelper.GetRoleCount(siteID, OwnerRank.All);
            roleList = AccountHelper.GetRoles(siteID, AdvicePager.Begin, AdvicePager.PageSize);
            RolesGridView.DataSource = roleList;
            RolesGridView.DataBind();
        }

        /// <summary>
        /// 加载用户
        /// </summary>
        void LoadUsers()
        {
            //string ownerType = "user";
            //int typeID = ownerType == "role" ? Constants.OwnerRole : Constants.OwnerAccount;
            List<string> ownerIds = AccountHelper.GetPermissionOwners(Constants.OwnerAccount, AdviceTypeID);
            List<Account> users = AccountHelper.GetAccountList(ownerIds);

            UsersGridView.DataSource = users;
            UsersGridView.DataBind();
        }

        /// <summary>
        /// 绑定权限数据
        /// </summary>
        /// <param name="e"></param>
        /// <param name="ownerType"></param>
        void BindPermisstionsData(GridViewRowEventArgs e, string ownerType)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                AdviceType adviceType = AdviceTypeHelper.GetAdviceType(AdviceTypeID);
                if (adviceType != null)
                {
                    e.Row.Cells[6].Visible = false;
                    e.Row.Cells[7].Visible = false;
                    e.Row.Cells[8].Visible = false;

                    //上报办理涉及到审核（一审，二审，三审）
                    if (adviceType.StateText == "上报办理" && adviceType.FlowSeries.ToString() != null)
                    {
                        switch (adviceType.FlowSeries)
                        {
                            case 1:
                                e.Row.Cells[6].Visible = true;
                                e.Row.Cells[7].Visible = false;
                                e.Row.Cells[8].Visible = false;
                                break;
                            case 2:
                                e.Row.Cells[6].Visible = true;
                                e.Row.Cells[7].Visible = true;
                                e.Row.Cells[8].Visible = false;
                                if (e.Row.RowType == DataControlRowType.Header)
                                {
                                    e.Row.Cells[6].Text = "一审";
                                }
                                break;
                            case 3:
                                e.Row.Cells[6].Visible = true;
                                e.Row.Cells[7].Visible = true;
                                e.Row.Cells[8].Visible = true;
                                if (e.Row.RowType == DataControlRowType.Header)
                                {
                                    e.Row.Cells[6].Text = "一审";
                                }
                                break;
                        }
                    }

                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        System.Web.UI.HtmlControls.HtmlInputHidden roleIDHidden = (System.Web.UI.HtmlControls.HtmlInputHidden)e.Row.FindControl("IDHidden");
                        string roleID = roleIDHidden.Value;

                        int typeID = ownerType == "role" ? Constants.OwnerRole : Constants.OwnerAccount;
                        List<string> ps = AccountHelper.GetPermissionContents(typeID.ToString(CultureInfo.InvariantCulture), roleID, AdviceTypeID);
                        if (ps == null)
                        {
                            Messages.ShowError("无权限设置！");
                            return;
                        }

                        CheckBox AdviceAdminCheckbox = (CheckBox)e.Row.FindControl("AdviceAdminCheckbox");
                        if (AdviceAdminCheckbox != null)
                        {
                            AdviceAdminCheckbox.Checked = ps.Contains("Advice.Admin");
                        }

                        CheckBox AdviceReadCheckBox = (CheckBox)e.Row.FindControl("AdviceReadCheckBox");
                        if (AdviceReadCheckBox != null)
                        {
                            AdviceReadCheckBox.Checked = ps.Contains("Advice.Read");
                        }

                        CheckBox AdviceAcceptCheckbox = (CheckBox)e.Row.FindControl("AdviceAcceptCheckbox");
                        if (AdviceAcceptCheckbox != null)
                        {
                            AdviceAcceptCheckbox.Checked = ps.Contains("Advice.Accept");
                        }

                        CheckBox AdviceHandleCheckbox = (CheckBox)e.Row.FindControl("AdviceHandleCheckbox");
                        if (AdviceHandleCheckbox != null)
                        {
                            AdviceHandleCheckbox.Checked = ps.Contains("Advice.Handle");
                        }

                        CheckBox AdviceFirstAuditCheckBox = (CheckBox)e.Row.FindControl("AdviceFirstAuditCheckBox");
                        if (AdviceFirstAuditCheckBox != null)
                        {
                            AdviceFirstAuditCheckBox.Checked = ps.Contains("Advice.FirstAudit");
                        }
                        CheckBox AdviceSecondAuditCheckBox = (CheckBox)e.Row.FindControl("AdviceSecondAuditCheckBox");
                        if (AdviceSecondAuditCheckBox != null)
                        {
                            AdviceSecondAuditCheckBox.Checked = ps.Contains("Advice.SecondAudit");
                        }
                        CheckBox AdviceThirdAuditCheckBox = (CheckBox)e.Row.FindControl("AdviceThirdAuditCheckBox");
                        if (AdviceThirdAuditCheckBox != null)
                        {
                            AdviceThirdAuditCheckBox.Checked = ps.Contains("Advice.ThirdAudit");
                        }

                        CheckBox AdviceRefuseCheckbox = (CheckBox)e.Row.FindControl("AdviceRefuseCheckbox");
                        if (AdviceRefuseCheckbox != null)
                        {
                            AdviceRefuseCheckbox.Checked = ps.Contains("Advice.Refuse");
                        }
                        CheckBox AdviceTransferCheckbox = (CheckBox)e.Row.FindControl("AdviceTransferCheckbox");
                        if (AdviceTransferCheckbox != null)
                        {
                            AdviceTransferCheckbox.Checked = ps.Contains("Advice.Transfer");
                        }
                    }
                }
            }
        }


        /// <summary>
        /// 保存角色/用户的权限
        /// </summary>
        /// <param name="objectGridView"></param>
        /// <param name="ownerType"></param>
        void SaveObjectPermissions(GridView objectGridView, string ownerType)
        {
            int typeID = ownerType == "role" ? Constants.OwnerRole : Constants.OwnerAccount;
            for (int i = 0; i < objectGridView.Rows.Count; i++)
            {
                System.Web.UI.HtmlControls.HtmlInputHidden objIDHidden = (System.Web.UI.HtmlControls.HtmlInputHidden)objectGridView.Rows[i].FindControl("IDHidden");
                string objectID = objIDHidden.Value;

                AccountHelper.DeletePermission(typeID, objectID, AdviceTypeID);
                ArrayList al = new ArrayList();
                if (((CheckBox)objectGridView.Rows[i].FindControl("AdviceReadCheckBox")).Checked)
                {
                    al.Add("Advice.Read");
                }
                if (((CheckBox)objectGridView.Rows[i].FindControl("AdviceAdminCheckbox")).Checked)
                {
                    al.Add("Advice.Admin");
                }
                if (((CheckBox)objectGridView.Rows[i].FindControl("AdviceAcceptCheckbox")).Checked)
                {
                    al.Add("Advice.Accept");
                }
                if (((CheckBox)objectGridView.Rows[i].FindControl("AdviceHandleCheckbox")).Checked)
                {
                    al.Add("Advice.Handle");
                }
                if (((CheckBox)objectGridView.Rows[i].FindControl("AdviceFirstAuditCheckBox")).Checked)
                {
                    al.Add("Advice.FirstAudit");
                }
                if (((CheckBox)objectGridView.Rows[i].FindControl("AdviceSecondAuditCheckBox")).Checked)
                {
                    al.Add("Advice.SecondAudit");
                }
                if (((CheckBox)objectGridView.Rows[i].FindControl("AdviceThirdAuditCheckBox")).Checked)
                {
                    al.Add("Advice.ThirdAudit");
                }
                if (((CheckBox)objectGridView.Rows[i].FindControl("AdviceRefuseCheckbox")).Checked)
                {
                    al.Add("Advice.Refuse");
                }
                if (((CheckBox)objectGridView.Rows[i].FindControl("AdviceTransferCheckBox")).Checked)
                {
                    al.Add("Advice.Transfer");
                }

                string[] adds = (string[])al.ToArray(typeof(string));
                AccountHelper.AddPermission(typeID, objectID, AdviceTypeID, adds);
            }
        }

        protected void UsersGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            BindPermisstionsData(e, "user");
        }

        protected void userAddSubmit_ServerClick(object sender, EventArgs e)
        {
            Account acc = AccountHelper.GetAccountByLoginName(userNameInput.Value);
            if (acc == null)
                Messages.ShowError(string.Format("没有找到用户“{0}”，请输入正确的用户登录名再试。", userNameInput.Value));
            else
            {
                AccountHelper.AddPermission(Constants.OwnerAccount, acc.ID, AdviceTypeID, new string[] { "Advice.Read" });
                LoadUsers();
            }
        }
    }
}