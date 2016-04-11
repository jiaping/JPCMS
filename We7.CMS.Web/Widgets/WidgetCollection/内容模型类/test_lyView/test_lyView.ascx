﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetAdviceDetail" %>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "留言详细信息部件", Author = "系统生成")]
    string MetaData;
</script>
<table>
    <tr>
        <th>
            受理编号
        </th>
        <td>
            <%=Item.SN %>
        </td>
    </tr>
    <tr>
        <th>
            标题
        </th>
        <td>
            <%=Item.Title %>
        </td>
    </tr>
    <tr>
        <th>
            办理人
        </th>
        <td>
            <%=Item.Name %>
        </td>
    </tr>
    <tr>
        <th>
            办理内容
        </th>
        <td>
            <%=Item.Content %>
        </td>
    </tr>
    <tr>
        <th>
            受理时间
        </th>
        <td>
            <%=Item.Created %>
        </td>
    </tr>
    <tr>
        <th>
            状态
        </th>
        <td>
            <%=Item.StateText %>
        </td>
    </tr>
        <tr>
		<th>
            ID
        </th>
		   <td>
				<%=Item["ID"] %>
		   </td>
		   </tr>
	        <tr>
		<th>
            是否前台显示
        </th>
		   <td>
				<%=Item["IsShow"] %>
		   </td>
		   </tr>
	        <tr>
		<th>
            标题
        </th>
		   <td>
				<%=Item["Title"] %>
		   </td>
		   </tr>
	        <tr>
		<th>
            姓名
        </th>
		   <td>
				<%=Item["Name"] %>
		   </td>
		   </tr>
	        <tr>
		<th>
            年龄
        </th>
		   <td>
				<%=Item["age"] %>
		   </td>
		   </tr>
	        <tr>
		<th>
            性别
        </th>
		   <td>
				<%=Item["sex"] %>
		   </td>
		   </tr>
	        <tr>
		<th>
            案例
        </th>
		   <td>
				<%=Item["Demo"] %>
		   </td>
		   </tr>
	    </table>
<table>
	<tr>
		<td>回复内容</td>
	</tr>
	<% for(int i=0;i<Replies.Count;i++){%>
	<tr>
		<td>回答者：<%=GetAccountName(Replies[i].UserID) %>|时间：<%=Replies[i].Created.ToString("yyyy-MM-dd") %></td>
	</tr>	
	<tr>
		<td><%=Replies[i].Content %></td>
	</tr>
	<%}%>
</table>
<%--系统提供的方法
string ToStr(object fieldValue)
string ToStr(object fieldValue, int maxlength)
string ToStr(object fieldValue, int maxlength, string tail)
string ToDateStr(object fieldValue, string fmt)
string ToDateStr(object fieldValue)
int? ToInt(object fieldValue)
string GetUrl(object id)
--%>
