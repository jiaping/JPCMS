﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace We7.CMS.Web.Admin.DataControlUI
{
    public partial class DataControlDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Controls.Add(this.LoadControl("~/_skins/default/channel.ascx"));
        }
    }
}
