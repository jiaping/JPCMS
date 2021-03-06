﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetAdviceList" %>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "留言信息列表部件", Author = "系统生成")]
    string MetaData;
</script>
<div class="<%=CssClass%>">
<table>
    <% 
   if (Items != null && Items.Count > 0)
    {
     foreach (AdviceInfo Item in Items)
       { %>
    <tr>
        <td>
            <%=Item.SN %>
        </td>
        <td> 
         <%  if (Item.Public==1)
              { %>
        <a href="<%=GetUrl(Item.ID) %>">
        <%} else {%>
        <a href="<%=GetUrl(Item.ID) %>" onclick="return checkadvice(this,'<%=Item.ID%>')">
        <%}%>
            <%=Item.Title %></a>
        </td>
        <td>
           <%=Item.Name %>
        </td>
        <td>
            <%=Item.Created.ToString("yyyy-MM-dd") %>
        </td>
        <td>
            <%=Item.StateText %>
        </td>
        		   <td>
				<%=Item["ID"] %>
		   </td>
	    		   <td>
				<%=Item["IsShow"] %>
		   </td>
	    		   <td>
				<%=Item["Title"] %>
		   </td>
	    		   <td>
				<%=Item["Name"] %>
		   </td>
	    		   <td>
				<%=Item["age"] %>
		   </td>
	    		   <td>
				<%=Item["sex"] %>
		   </td>
	    		   <td>
				<%=Item["Demo"] %>
		   </td>
	        </tr>
    <%}} %>
</table>
</div>
<%= Pager.PagedHtml%>
<%--系统提供的方法
string ToStr(object fieldValue)
string ToStr(object fieldValue, int maxlength)
string ToStr(object fieldValue, int maxlength, string tail)
string ToDateStr(object fieldValue, string fmt)
string ToDateStr(object fieldValue)
int? ToInt(object fieldValue)
string GetUrl(object id)
--%>
