<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="/Widgets/WidgetCollection/静态类/banner/banner.ascx" TagName="banner" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/导航类/ChannelMenu.TopMenu/ChannelMenu.TopMenu.ascx" TagName="ChannelMenu_TopMenu" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/导航类/Sidebar.ChannelNav/Sidebar.ChannelNav.ascx" TagName="Sidebar_ChannelNav" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/文章列表类/Recommand.Newest/Recommand.Newest.ascx" TagName="Recommand_Newest" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/静态类/honglatiao/honglatiao.ascx" TagName="honglatiao" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/文章列表类/ArticleList/ArticleList.ascx" TagName="ArticleList" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/静态类/foot/foot.ascx" TagName="foot" TagPrefix="wew" %>

<html>
<head runat="server">
    <title></title>
    <link href="/Admin/VisualTemplate/Style/VisualDesign.LayoutsBasics.css" rel="stylesheet" type="text/css">
<link href="/Widgets/Themes/theme/Style.css" type="text/css" rel="stylesheet" class="themestyle" id="themestyle"><script src="/Widgets/Scripts/jquery.pack.js" type="text/javascript" class="jquerypack" id="jquerypack"></script><script src="/Widgets/Scripts/jquery.peex.js" type="text/javascript" class="jquerypeex" id="jquerypeex"></script><script src="/Widgets/Scripts/Plugins/Common.js" type="text/javascript" class="commonPlugin" id="commonPlugin"></script><link href="/Widgets/WidgetCollection/静态类/banner/Style/banner.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/静态类/foot/Style/foot.css" type="text/css" rel="stylesheet"><link href="/_skins/we7/Style/UxStyle.css" type="text/css" rel="stylesheet"><link href="/_skins/we7/Style/UxStyle.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/静态类/honglatiao/Style/honglatiao.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/文章列表类/ArticleList/Style/ArticleList.css" type="text/css" rel="stylesheet"></head>
<body style="background-color:rgb(255, 255, 255);background-image:url('');background-position:left top;background-repeat:repeat; background-attachment:scroll;">
    <div id="pagecontainer" style="width:950px;margin:0 auto">
        <we7design:we7zoneplaceholder id="bodyplaceholder" runat="server"><we7design:we7layout runat="server" id="we7layout_131423549958168">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423549958168_cloumn1">
 <wew:banner control="banner" filename="/Widgets/WidgetCollection/静态类/banner/banner.ascx" id="banner_131425510901020" cssclass="banner" runat="server"></wew:banner></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131423549762949">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423549762949_cloumn1">
 <wew:ChannelMenu_TopMenu id="ChannelMenu_TopMenu_131425520378514" cssclass="ChannelMenu_daxue" filename="/Widgets/WidgetCollection/导航类/ChannelMenu.TopMenu/ChannelMenu.TopMenu.ascx" runat="server"></wew:ChannelMenu_TopMenu></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_1314235491204100">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_1314235491204100_cloumn1" style="margin-top:8px;" cssclass="">
 <we7design:we7layout runat="server" id="we7layout_131423590383661">
 <we7design:we7layoutcolumn float="left" width="229" widthunit="px" runat="server" id="we7layout_131423590383661_cloumn1" style="" cssclass="">
 <wew:Sidebar_ChannelNav id="Sidebar_ChannelNav_131432708455663" icon="" bordercolor="" margintop10="False" cssclass="Sidebar_daohang" ownerid="" filename="/Widgets/WidgetCollection/导航类/Sidebar.ChannelNav/Sidebar.ChannelNav.ascx" runat="server"></wew:Sidebar_ChannelNav><we7design:we7layout runat="server" id="we7layout_131432792622648">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131432792622648_cloumn1">
 <wew:Recommand_Newest id="Recommand_Newest_131432793866228" tags="" margintop10="True" includechildren="True" isshow="False" bordercolor="" icon="" pagesize="8" ownerid="" cssclass="Recommadn" dateformat="[MM-dd]" titlelength="28" slidersize="5" filename="/Widgets/WidgetCollection/文章列表类/Recommand.Newest/Recommand.Newest.ascx" runat="server"></wew:Recommand_Newest></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
 <we7design:we7layoutcolumn float="left" width="1" widthunit="px" runat="server" id="we7layout_131423590383661_cloumn2" style="" cssclass="">
 </we7design:we7layoutcolumn>
  <we7design:we7layoutcolumn float="left" width="711" widthunit="px" runat="server" id="we7layout_131423590383661_cloumn3" style="" cssclass="">
 <we7design:we7layout runat="server" id="we7layout_131434157479679">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131434157479679_cloumn1" style="" cssclass="">
 <we7design:we7layout runat="server" id="we7layout_13143416122253">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_13143416122253_cloumn1">
 <wew:honglatiao control="honglatiao" filename="/Widgets/WidgetCollection/静态类/honglatiao/honglatiao.ascx" id="honglatiao_131434167973354" cssclass="honglatiao" runat="server"></wew:honglatiao><we7design:we7layout runat="server" id="we7layout_131434217490994">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131434217490994_cloumn1">
 <wew:ArticleList id="ArticleList_131434324232726" icon="" marginleft10="True" margintop10="True" bordercolor="" isshow="False" tags="" pagesize="10" ownerid="{37fd0530-794b-49a5-b2cc-96d22a2d6d36}" cssclass="ArticleList" includechildren="True" dateformat="[MM-dd]" titlelength="30" filename="/Widgets/WidgetCollection/文章列表类/ArticleList/ArticleList.ascx" runat="server"></wew:ArticleList></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_13143421713179">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_13143421713179_cloumn1">
 <wew:ArticleList id="ArticleList_131434387325810" icon="" marginleft10="True" margintop10="True" bordercolor="" isshow="False" tags="" pagesize="10" ownerid="{6f55dd7d-83ad-46a7-ae82-6dd92acb098a}" cssclass="ArticleList" includechildren="True" dateformat="[MM-dd]" titlelength="30" filename="/Widgets/WidgetCollection/文章列表类/ArticleList/ArticleList.ascx" runat="server"></wew:ArticleList></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131434217771047">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131434217771047_cloumn1">
 <wew:ArticleList id="ArticleList_131434387646165" icon="" marginleft10="True" margintop10="True" bordercolor="" isshow="False" tags="" pagesize="10" ownerid="{1fbea0ad-8240-4bc6-811c-4738cee356fa}" cssclass="ArticleList" includechildren="True" dateformat="[MM-dd]" titlelength="30" filename="/Widgets/WidgetCollection/文章列表类/ArticleList/ArticleList.ascx" runat="server"></wew:ArticleList></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131434161611841">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131434161611841_cloumn1">
 <wew:ArticleList id="ArticleList_131434388002228" icon="" marginleft10="True" margintop10="True" bordercolor="" isshow="False" tags="" pagesize="10" ownerid="{1b3936c1-2f04-4d37-a3b2-aae9d3f60a12}" cssclass="ArticleList" includechildren="True" dateformat="[MM-dd]" titlelength="30" filename="/Widgets/WidgetCollection/文章列表类/ArticleList/ArticleList.ascx" runat="server"></wew:ArticleList></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131423549567057">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423549567057_cloumn1">
 <wew:foot control="foot" filename="/Widgets/WidgetCollection/静态类/foot/foot.ascx" id="foot_131432527377493" cssclass="foot" runat="server"></wew:foot></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7zoneplaceholder>
    </div>
</body>
</html>