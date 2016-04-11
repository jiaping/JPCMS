<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="ArticleList.cs"
    Inherits="We7.CMS.Web.Widgets.ArticleList" %>
<div class="<%= CssClass %> <%=MarginCss %> ">
    <div class="area">
        <h3 <%=BackgroundIcon() %>><%=Channel.Name %></h3>
        <ul <%=SetBoxBorderColor() %>>
            <% foreach (Article article in Articles)
               { %>
            <li><a target="_self" href="<%=article.Url %>">
                <%=ToStr(article.Title,TitleLength) %></a></li>
            <%} %>
        </ul><div class="clear"></div>
    </div>
</div>
