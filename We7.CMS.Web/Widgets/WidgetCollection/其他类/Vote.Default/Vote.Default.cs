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
using We7.CMS.Common;
using System.Collections.Generic;
using We7.Framework;
using We7.CMS.WebControls;
using Thinkment.Data;
using We7.CMS.WebControls.Core;

namespace We7.CMS.Web.Widgets
{
    [ControlGroupDescription(Label = "投票", Icon = "投票", Description = "投票", DefaultType = "Vote.Default")]
    [ControlDescription(Desc = "投票")]
    public partial class Vote_Default : BaseControl
    {
        private We7.CMS.Common.Vote vote;
        private We7.CMS.Common.VoteEntry voteEntrys;
        private IVoteHelper VoteHelper = VoteFactory.Instance;

        /// <summary>
        /// 投票（投票ID）
        /// </summary>
        [Parameter(Title = "投票", Type = "KeyValueSelector", Required = true, Data = "vote")]
        public string VoteID;


        /// <summary>
        /// 自定义Css类名称
        /// </summary>
        [Parameter(Title = "自定义Css类名称", Type = "String", DefaultValue = "Vote_Default")]
        public string CssClass;

        /// <summary>
        /// 自定义的css样式
        /// </summary>
        protected virtual string Css
        {
            get
            {
                return CssClass;
            }
        }
	/// </summary>
        [Parameter(Title = "自定义图标样式", Type = "CustomImage", DefaultValue = "")]
        public string Icon;

        /// <summary>
        /// 自定义图标
        /// </summary>
        protected virtual string CustomIcon
        {
            get
            {
                return Icon;
            }
        }
	protected string BackgroundIcon()
        {
            if (!string.IsNullOrEmpty(CustomIcon))
            {
                return string.Format("style=\"background:url({0}) no-repeat;\"", CustomIcon);
            }
            return string.Empty;
        }
	/// </summary>
        [Parameter(Title = "自定义边框样式", Type = "ColorSelector", DefaultValue = "")]
        public string BorderColor;

        protected virtual string BoxBorderColor
        {
            get
            {
                return BorderColor;
            }
        }
	protected string SetBoxBorderColor()
        {
            if (!string.IsNullOrEmpty(BoxBorderColor))
            {
                return string.Format("style=\"border-color:{0};\"", BoxBorderColor);
            }
            return string.Empty;
        }
        /// <summary>
        /// 当前投票
        /// </summary>
        protected We7.CMS.Common.Vote CurrVote
        {
            get
            {
                if (vote == null)
                {
                    vote = GetData();
                }
                return vote;
            }
            set 
            { 
                vote = value; 
            }
        }

        protected We7.CMS.Common.Vote GetData() 
        {
            We7.CMS.Common.Vote currVote = VoteHelper.GetVoteByID(VoteID);
            if (currVote != null && !string.IsNullOrEmpty(currVote.ID))
                currVote.ListVoteEntrys = VoteHelper.GetVoteEntrysByID(currVote.ID);
            return currVote;
        }

        protected override void OnDesigning()
        {
            if (string.IsNullOrEmpty(VoteID))
                vote = GetExampleData();
            else
            {
                vote = GetData();
            }
        }

        /// <summary>
        /// 得到例子数据
        /// </summary>
        /// <returns></returns>
        private We7.CMS.Common.Vote GetExampleData()
        {
            We7.CMS.Common.Vote vote=null;
            
            vote = new Common.Vote();
            vote.OptionType = 1;
            vote.Title = "投票测试";
            vote.ListVoteEntrys = new List<VoteEntry>();
            VoteEntry voteEntry = new VoteEntry();
            voteEntry.EntryText = "选项1";
            vote.ListVoteEntrys.Add(voteEntry);
            voteEntry = new VoteEntry();
            voteEntry.EntryText = "选项2";
            vote.ListVoteEntrys.Add(voteEntry);

            return vote;
        }
    }
}