<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="ChannelMenu.TopMenu.OneGrade.cs" Inherits="We7.CMS.Web.Widgets.ChannelMenu_TopMenu_OneGrade" %>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "网站顶部菜单显示一级", Author = "系统")]
    [RemoveParameter("Tag")]
    string MetaData;
</script>
<div class="<%=Css %>">
<div class="menu">
    <div class="main_menu" id="menubox">
        <ul>
            <% if (IsSelected(null))
               { %>
            <li class="current">
                <%}
               else
               { %>
                <li>
                    <%} %>
                    <a target="_self" href="/"><span><em>网站首页</em></span></a></li>
                <% foreach (Channel ch in FirstLevelChannels)
                   {
                       if (IsSelected(ch))
                       { %>
                <li class="current">
                    <%}
                       else
                       { %>
                    <li>
                        <%} %>
                        <a target="_self" href="<%=ch.RealUrl %>"><span><em>
                            <%=ch.Name %></em></span></a></li>
                    <%} %>
        </ul>
    </div>
</div>
</div>