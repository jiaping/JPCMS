<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="/Widgets/WidgetCollection/网站页头/Header.LogoFlashWithTopItem/Header.LogoFlashWithTopItem.ascx" TagName="Header_LogoFlashWithTopItem" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/导航类/ChannelMenu.TopMenu.OneGrade/ChannelMenu.TopMenu.OneGrade.ascx" TagName="ChannelMenu_TopMenu_OneGrade" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/导航类/Sidebar.ChannelNav/Sidebar.ChannelNav.ascx" TagName="Sidebar_ChannelNav" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/文章列表类/Recommand.Newest/Recommand.Newest.ascx" TagName="Recommand_Newest" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/文章列表类/PagedArticleList.Default/PagedArticleList.Default.ascx" TagName="PagedArticleList_Default" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/静态类/foot/foot.ascx" TagName="foot" TagPrefix="wew" %>

<html>
<head runat="server">
    <title></title>
    <link href="/Admin/VisualTemplate/Style/VisualDesign.LayoutsBasics.css" rel="stylesheet" type="text/css">
<link href="/Widgets/Themes/theme/Style.css" type="text/css" rel="stylesheet" class="themestyle" id="themestyle"><script src="/Widgets/Scripts/jquery.pack.js" type="text/javascript" class="jquerypack" id="jquerypack"></script><script src="/Widgets/Scripts/jquery.peex.js" type="text/javascript" class="jquerypeex" id="jquerypeex"></script><script src="/Widgets/Scripts/Plugins/Common.js" type="text/javascript" class="commonPlugin" id="commonPlugin"></script><link href="/Widgets/WidgetCollection/静态类/foot/Style/foot.css" type="text/css" rel="stylesheet"><link href="/_skins/we7/Style/UxStyle.css" type="text/css" rel="stylesheet"><link href="/_skins/we7/Style/UxStyle.css" type="text/css" rel="stylesheet"></head>
<body style="background-color:rgb(255, 255, 255);background-image:url('');background-position:left top;background-repeat:repeat; background-attachment:scroll;">
    <div id="pagecontainer" style="width:950px;margin:0 auto">
        <we7design:we7zoneplaceholder id="bodyplaceholder" runat="server"><we7design:we7layout runat="server" id="we7layout_131423549958168">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423549958168_cloumn1">
 <wew:Header_LogoFlashWithTopItem control="Header_LogoFlashWithTopItem" filename="/Widgets/WidgetCollection/网站页头/Header.LogoFlashWithTopItem/Header.LogoFlashWithTopItem.ascx" id="Header_LogoFlashWithTopItem_14607974820376" cssclass="Header_LogoFlashWithTopItem" runat="server"></wew:Header_LogoFlashWithTopItem></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131423549762949">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423549762949_cloumn1">
 <wew:ChannelMenu_TopMenu_OneGrade control="ChannelMenu_TopMenu_OneGrade" filename="/Widgets/WidgetCollection/导航类/ChannelMenu.TopMenu.OneGrade/ChannelMenu.TopMenu.OneGrade.ascx" id="ChannelMenu_TopMenu_OneGrade_146079751443460" cssclass="ChannelMenu_TopMenu_OneGrade" runat="server"></wew:ChannelMenu_TopMenu_OneGrade></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_1314235491204100">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_1314235491204100_cloumn1" style="margin-top:8px;" cssclass="">
 <we7design:we7layout runat="server" id="we7layout_131423590383661">
 <we7design:we7layoutcolumn float="left" width="229" widthunit="px" runat="server" id="we7layout_131423590383661_cloumn1" style="" cssclass="">
 <wew:sidebar_channelnav id="Sidebar_ChannelNav_131432708455663" icon="" bordercolor="" margintop10="False" cssclass="Sidebar_daohang" ownerid="" filename="/Widgets/WidgetCollection/导航类/Sidebar.ChannelNav/Sidebar.ChannelNav.ascx" runat="server"></wew:sidebar_channelnav><we7design:we7layout runat="server" id="we7layout_131432792622648">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131432792622648_cloumn1">
 <wew:recommand_newest id="Recommand_Newest_131432793866228" tags="" margintop10="True" includechildren="True" isshow="False" bordercolor="" icon="" pagesize="8" ownerid="" cssclass="Recommadn" dateformat="[MM-dd]" titlelength="28" slidersize="5" filename="/Widgets/WidgetCollection/文章列表类/Recommand.Newest/Recommand.Newest.ascx" runat="server"></wew:recommand_newest></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
 <we7design:we7layoutcolumn float="left" width="1" widthunit="px" runat="server" id="we7layout_131423590383661_cloumn2" style="" cssclass="">
 </we7design:we7layoutcolumn>
  <we7design:we7layoutcolumn float="left" width="711" widthunit="px" runat="server" id="we7layout_131423590383661_cloumn3" style="" cssclass="">
 <wew:pagedarticlelist_default id="PagedArticleList_Default_13143292536398" margintop10="True" includechildren="True" dateformat="[MM-dd]" tags="" bordercolor="" icon="" isshow="False" titlelength="80" pager-pagesize="20" pager-requestpageindex="pi" cssclass="Pagg_List" pager-pagerdivclass="page_css page_line" ownerid="" pager-vmtemplatefilename="/Widgets/WidgetCollection/文章列表类/PagedArticleList.Default/vm/pager.vm" pager-pagerspanclass="pagecss" filename="/Widgets/WidgetCollection/文章列表类/PagedArticleList.Default/PagedArticleList.Default.ascx" runat="server"></wew:pagedarticlelist_default></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131423549567057">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423549567057_cloumn1">
 <wew:foot control="foot" filename="/Widgets/WidgetCollection/静态类/foot/foot.ascx" id="foot_131432527377493" cssclass="foot" runat="server"></wew:foot></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7zoneplaceholder>
    </div>
</body>
</html>