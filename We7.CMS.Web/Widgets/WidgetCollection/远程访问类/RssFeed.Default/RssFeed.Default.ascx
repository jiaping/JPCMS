<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="RssFeed.Default.cs"
 Inherits="We7.CMS.Web.Widgets.RssFeed_Default" %>

<div class="<%= CssClass %> <%=MarginCss %> " >
<div class="area">
    <h3>        
            <%=PageTitle%><a title="更多" target="_blank" href="<%=RssUrl %>">
                <img align="absmiddle" alt="更多" src="<%=ThemePath %>/images/feed.gif"></a></h3>
    <ul>
        <% foreach (Article article in Articles)
           { %>
        <li><a target="_blank" href="<%=article.LinkUrl %>">
            <%=ToStr(article.Title,TitleLength) %></a><span class="datetime"><%=ToDateStr(article.Updated,DateFormat) %></span></li>
        <%} %>
    </ul>
    </div>
</div>
