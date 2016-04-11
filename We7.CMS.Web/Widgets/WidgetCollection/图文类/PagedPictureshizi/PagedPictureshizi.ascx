<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="PagedPictureshizi.cs"
    Inherits="We7.CMS.Web.Widgets.PagedPictureshizi" %>
<div class="<%=Css %>">
<div class="article_list ">
    <h3 <%=BackgroundIcon() %>>     
            <%= Channel!=null ? Channel.Name: "" %></h3>
    <ul <%=SetBoxBorderColor() %>>
        <% foreach (Article article in Articles)
           {
         %>
        <li><span><img alt="<%=article.Title %>" src="<%=article.GetTagThumbnail(ThumbnailTag) %>"></span><h2><%=ToStr(article.Title, TitleLength)%></h2><samp></samp><h1><a target="_self" href="<%=article.Url %>">详细</a></h1><div class="clear"></div>
            </li>
        <%} %>
        
    </ul>
    <div class="clear"></div>
    <%= Pager.PagedHtml%>
    <div class="clear"></div>
    <div class="underline_left"></div>
</div>
</div>