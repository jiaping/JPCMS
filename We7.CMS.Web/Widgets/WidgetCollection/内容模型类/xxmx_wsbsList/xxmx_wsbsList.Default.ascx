<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetList" %>
<div class="<%=CssClass %> <%=MarginCss %>">
    <h3>
        <span><em>
            <%=Channel.Name %></em></span><a title="更多" target="_blank" href="<%=Channel.FullUrl %>">
                <img align="absmiddle" alt="更多" src="<%=ThemePath %>/images/more.gif"></a></h3>
    <ul>
        <% foreach (DataRow Item in Items)
           { %>
        <li>
			<a target="_self" href="<%=GetUrl(Item["ID"]) %>">
									<%=Item["ServiceObject"] %>&nbsp;
							</a>
			<span class="datetime"><%=ToDateStr(Item["Updated"],DateFormat) %></span></li>
        <%} %>
    </ul>
    <div class="underline_area">
    </div>
</div>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "网上办事列表部件", Author = "系统生成")]
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
