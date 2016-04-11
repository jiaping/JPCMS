<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="/Widgets/WidgetCollection/网站页头/Header.LogoQueryQuick/Header.LogoQueryQuick.ascx" TagName="Header_LogoQueryQuick" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/导航类/ChannelMenu.TopMenu/ChannelMenu.TopMenu.ascx" TagName="ChannelMenu_TopMenu" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/图文类/FlashShow.Default/FlashShow.Default.ascx" TagName="FlashShow_Default" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/文章列表类/ArticleList.Default/ArticleList.Default.ascx" TagName="ArticleList_Default" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/文章列表类/ArticleList.2ColumnWidthImage/ArticleList.2ColumnWidthImage.ascx" TagName="ArticleList_2ColumnWidthImage" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/文章列表类/ArticleList.SideList/ArticleList.SideList.ascx" TagName="ArticleList_SideList" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/搜索类/Search.Bar/Search.Bar.ascx" TagName="Search_Bar" TagPrefix="wew" %>

<%@ Register Src="/Widgets/WidgetCollection/文章列表类/Recommand.Newest/Recommand.Newest.ascx" TagName="Recommand_Newest" TagPrefix="wew" %>

<html>
<head runat="server">
    <title></title>
    <link href="/Admin/VisualTemplate/Style/VisualDesign.LayoutsBasics.css" rel="stylesheet" type="text/css">
<link href="/Widgets/Themes/theme/Style.css" type="text/css" rel="stylesheet" class="themestyle" id="themestyle"><script src="/Widgets/Scripts/jquery.pack.js" type="text/javascript" class="jquerypack" id="jquerypack"></script><script src="/Widgets/Scripts/jquery.peex.js" type="text/javascript" class="jquerypeex" id="jquerypeex"></script><script src="/Widgets/Scripts/Plugins/Common.js" type="text/javascript" class="commonPlugin" id="commonPlugin"></script><link href="/Widgets/WidgetCollection/导航类/ChannelMenu.TopMenu/Style/ChannelMenu.TopMenu.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/图文类/FlashShow.Default/Style/FlashShow.Default.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/文章列表类/ArticleList.Default/Style/ArticleList.Default.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/搜索类/Search.Bar/Style/Search.Bar.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/文章列表类/ArticleList.2ColumnWidthImage/Style/ArticleList.2ColumnWidthImage.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/文章列表类/ArticleList.SideList/Style/ArticleList.SideList.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/文章列表类/Recommand.Newest/Style/Recommand.Newest.css" type="text/css" rel="stylesheet"><link href="/Widgets/WidgetCollection/网站页头/Header.LogoQueryQuick/Style/Header.LogoQueryQuick.css" type="text/css" rel="stylesheet"></head>
<body style="background-color:rgb(255, 255, 255);background-image:url('');background-position:left top;background-repeat:repeat; background-attachment:scroll;">
    <div id="pagecontainer" style="width:950px;margin:0 auto">
        <we7design:we7zoneplaceholder id="bodyplaceholder" runat="server"><we7design:we7layout runat="server" id="we7layout1">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423549958168_cloumn1">
 <wew:Header_LogoQueryQuick control="Header_LogoQueryQuick" filename="/Widgets/WidgetCollection/网站页头/Header.LogoQueryQuick/Header.LogoQueryQuick.ascx" id="Header_LogoQueryQuick_146035030597212" cssclass="Header_LogoQueryQuick" runat="server"></wew:Header_LogoQueryQuick></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131423549762949">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423549762949_cloumn1">
 <wew:ChannelMenu_TopMenu id="ChannelMenu_TopMenu_131425520378514" cssclass="ChannelMenu_daxue" filename="/Widgets/WidgetCollection/导航类/ChannelMenu.TopMenu/ChannelMenu.TopMenu.ascx" runat="server"></wew:ChannelMenu_TopMenu></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_1314235491204100">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_1314235491204100_cloumn1" style="margin-top:8px;" cssclass="">
 <we7design:we7layout runat="server" id="we7layout_131423590383661">
 <we7design:we7layoutcolumn float="left" width="473" widthunit="px" runat="server" id="we7layout_131423590383661_cloumn1" style="" cssclass="">
 <wew:FlashShow_Default id="FlashShow_Default_131425938085422" ownerid="{35beb5d6-5a8b-43ed-a4c8-6b80b5bc916a}" frameheight="251" includechildren="True" pagesize="4" thumbnailtag="flash" cssclass="" framewidth="472" tag="" filename="/Widgets/WidgetCollection/图文类/FlashShow.Default/FlashShow.Default.ascx" runat="server"></wew:FlashShow_Default></we7design:we7layoutcolumn>
 <we7design:we7layoutcolumn float="left" width="10" widthunit="px" runat="server" id="we7layout_131423590383661_cloumn2" style="" cssclass="">
 </we7design:we7layoutcolumn>
  <we7design:we7layoutcolumn float="left" width="467" widthunit="px" runat="server" id="we7layout_131423590383661_cloumn3" style="" cssclass="">
 <wew:ArticleList_Default id="ArticleList_Default_131426006002952" icon="" marginleft10="False" margintop10="False" bordercolor="" isshow="False" tags="" pagesize="8" ownerid="{35beb5d6-5a8b-43ed-a4c8-6b80b5bc916a}" cssclass="Artic_NEW" includechildren="True" dateformat="[MM-dd]" titlelength="50" filename="/Widgets/WidgetCollection/文章列表类/ArticleList.Default/ArticleList.Default.ascx" runat="server"></wew:ArticleList_Default></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131423548823986">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423548823986_cloumn1">
 <we7design:we7layout runat="server" id="we7layout_13142360156092">
 <we7design:we7layoutcolumn float="left" width="237" widthunit="px" runat="server" id="we7layout_13142360156092_cloumn1" style="" cssclass="">
 <we7design:we7layout runat="server" id="we7layout_131426205327728">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131426205327728_cloumn1">
 <wew:ArticleList_2ColumnWidthImage control="ArticleList_2ColumnWidthImage" filename="/Widgets/WidgetCollection/文章列表类/ArticleList.2ColumnWidthImage/ArticleList.2ColumnWidthImage.ascx" id="ArticleList_2ColumnWidthImage_146029553386586" cssclass="ArticleList_2ColumnWidthImage" runat="server"></wew:ArticleList_2ColumnWidthImage></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131426204966581">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131426204966581_cloumn1">
 <wew:ArticleList_SideList control="ArticleList_SideList" filename="/Widgets/WidgetCollection/文章列表类/ArticleList.SideList/ArticleList.SideList.ascx" id="ArticleList_SideList_146029594164050" cssclass="ArticleList_SideList" runat="server"></wew:ArticleList_SideList></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
 <we7design:we7layoutcolumn float="left" width="10" widthunit="px" runat="server" id="we7layout_13142360156092_cloumn2" style="" cssclass="">
 </we7design:we7layoutcolumn>
  <we7design:we7layoutcolumn float="left" width="461" widthunit="px" runat="server" id="we7layout_13142360156092_cloumn3" style="" cssclass="">
 <wew:ArticleList_Default id="ArticleList_Default_131426604295086" icon="" marginleft10="False" margintop10="True" bordercolor="" isshow="False" tags="" pagesize="7" ownerid="{c1ac765b-3b75-4355-ae58-9b3b85c62daa}" cssclass="Artic_List" includechildren="False" dateformat="[MM-dd]" titlelength="50" filename="/Widgets/WidgetCollection/文章列表类/ArticleList.Default/ArticleList.Default.ascx" runat="server"></wew:ArticleList_Default></we7design:we7layoutcolumn>
   <we7design:we7layoutcolumn float="left" width="10" widthunit="px" runat="server" id="we7layout_13142360156092_cloumn4" style="" cssclass="">
 <we7design:we7layout runat="server" id="we7layout_131458204682948">
 <we7design:we7layoutcolumn float="none" widthunit="px" width="10" runat="server" id="we7layout_131458204682948_cloumn1" style="" cssclass="">
 </we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
    <we7design:we7layoutcolumn float="left" width="232" widthunit="px" runat="server" id="we7layout_13142360156092_cloumn5" style="" cssclass="">
 <we7design:we7layout runat="server" id="we7layout_131426206096148">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131426206096148_cloumn1">
 <wew:FlashShow_Default control="FlashShow_Default" filename="/Widgets/WidgetCollection/图文类/FlashShow.Default/FlashShow.Default.ascx" id="FlashShow_Default_146029591251979" cssclass="FlashShow_Default" runat="server"></wew:FlashShow_Default></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_13142620576389">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_13142620576389_cloumn1">
 <wew:Search_Bar id="Search_Bar_131432415428946" searchpage="" cssclass="Search_Bar" filename="/Widgets/WidgetCollection/搜索类/Search.Bar/Search.Bar.ascx" runat="server"></wew:Search_Bar></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131426206411953">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131426206411953_cloumn1">
 </we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7layoutcolumn>
</we7design:we7layout><we7design:we7layout runat="server" id="we7layout_131423549567057">
 <we7design:we7layoutcolumn float="none" widthunit="%" width="100" runat="server" id="we7layout_131423549567057_cloumn1">
 <wew:Recommand_Newest control="Recommand_Newest" filename="/Widgets/WidgetCollection/文章列表类/Recommand.Newest/Recommand.Newest.ascx" id="Recommand_Newest_146029594914237" cssclass="Recommand_Newest" runat="server"></wew:Recommand_Newest></we7design:we7layoutcolumn>
</we7design:we7layout></we7design:we7zoneplaceholder>
    </div>
</body>
</html>