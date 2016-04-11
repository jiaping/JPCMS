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
        /// ��ȡ����ģ��ID
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

            Messages.ShowMessage("ģ��Ȩ���Ѹ��¡�");
        }

        void InitControls()
        {
            //SaveButton2.Attributes["onclick"] = "return AdviceBasicadviceTypeeck('" + this.ClientID + "');";
        }

        /// <summary>
        /// �������ݰ��¼��У��ж���Ҫ��ʾ���ֶ�
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
        /// ���ؽ�ɫ
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
        /// �����û�
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
        /// ��Ȩ������
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

                    //�ϱ������漰����ˣ�һ�󣬶�������
                    if (adviceType.StateText == "�ϱ�����" && adviceType.FlowSeries.ToString() != null)
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
                                    e.Row.Cells[6].Text = "һ��";
                                }
                                break;
                            case 3:
                                e.Row.Cells[6].Visible = true;
                                e.Row.Cells[7].Visible = true;
                                e.Row.Cells[8].Visible = true;
                                if (e.Row.RowType == DataControlRowType.Header)
                                {
                                    e.Row.Cells[6].Text = "һ��";
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
                            Messages.ShowError("��Ȩ�����ã�");
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
        /// �����ɫ/�û���Ȩ��
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
                Messages.ShowError(string.Format("û���ҵ��û���{0}������������ȷ���û���¼�����ԡ�", userNameInput.Value));
            else
            {
                AccountHelper.AddPermission(Constants.OwnerAccount, acc.ID, AdviceTypeID, new string[] { "Advice.Read" });
                LoadUsers();
            }
        }
    }
}