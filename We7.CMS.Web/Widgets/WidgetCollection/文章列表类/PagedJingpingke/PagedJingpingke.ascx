<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="PagedJingpingke.cs"
    Inherits="We7.CMS.Web.Widgets.PagedJingpingke" %>
<div class="<%=Css %>">
<div class="article_list ">
    <h3 <%=BackgroundIcon() %>>
        
            <%= Channel!=null ? Channel.Name: "" %></h3>
    <ul <%=SetBoxBorderColor() %>>
        <% foreach (Article article in Articles)
           { %>
        <li><a target="_self" href="<%=article.Url %>">
            <%
                string title = ToStr(article.Title, TitleLength);
                if (!string.IsNullOrEmpty(KeyWord))
                    title = title.Replace(KeyWord, "<em>" + KeyWord + "</em>");
            %>
            <%=title%></a><span class="datetime"><%=ToDateStr(article.Updated,DateFormat) %></span></li>
        <%} %>
        <div class="clear"></div>
    </ul>
    <div class="clear"></div>
    <%= Pager.PagedHtml%>
    <div class="clear"></div>
    <div class="underline_left"></div>
</div>
</div>