<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetPagedList" %>
<div class="<%=CssClass %> <%=MarginCss %>">
    <h3>
        <span><em>
            <%= Channel!=null ? Channel.Name: "" %></em></span></h3>
    <ul>
        <% foreach (DataRow Item in Items)
           { %>
        <li>
			<a target="_self" href="<%=GetUrl(Item["ID"]) %>">
									<%=Item["ServiceObject"] %>&nbsp;
							</a>
			<span class="datetime"><%=ToDateStr(Item["ID"],DateFormat) %></span></li>
        <%} %>
    </ul>
    <div class="clear">
    </div>
    <%= Pager.PagedHtml%>
    <div class="clear">
    </div>
    <div class="underline_left">
    </div>
</div>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "网上办事分页列表部件", Author = "系统生成")]
    string MetaData;

    public override string ModelName
    {
        get
        {
            return "xxmx.wsbs";
        }
    }

	public override string Fields
    {
        get
        {
            return "ServiceObject";
        }
    } 
</script>
