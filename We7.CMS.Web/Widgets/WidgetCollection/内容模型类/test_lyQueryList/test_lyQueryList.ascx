﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetAdviceQueryList" %>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "留言查询列表部件", Author = "系统生成")]
    string MetaData;
</script>
<table id="forSearch">
    <tr>
        <td>
            受理编号：
        </td>
        <td>
            <input type="text" id="SN" name="SN" value="" />
        </td>
        <% if(SecurityQuery) {%>
        <td>
            密码：
        </td>
        <td>
            <input type="password" id="Password" name="Password"  value="" />
        </td>
        <%} else {%>
			<td>
            关键字：
        </td>
        <td>
            <input type="text" id="KeyWord" name="KeyWord"  value="" />
        </td>
        <%}%>
        <td>
            <input type="submit" id="doCmd" value="查询" /><%=ErrorMessage %>
        </td>
    </tr>
</table>
<script type="text/javascript">
    $("#doCmd").bind("click", function () {
        //var Parms = "";
		var url="";
        $("#forSearch").find(":text,:password").each(function () {
            if ($(this).val() != "") {
                //Parms += "&" + $(this).attr("id") + "=" + $(this).val();
				url=setUrlParam(window.location.href,$(this).attr("id"),$(this).val());
            }
        });
        if (url != "")
            window.location.href = url;
        else
            alert("输入的查询条件不符合要求！");
    });

	    function setUrlParam(url, param, v)
        {
         var re = new RegExp("(\\\?|&)" + param + "=([^&]+)(&|$)", "i");
         var m = url.match(re);
         if (m)
         {
          return (url.replace(re, function($0, $1, $2) { return ($0.replace($2, v)); } ));
         }
         else
         {
          if (url.indexOf('?') == -1)
           return (url + '?' + param + '=' + v);
          else
           return (url + '&' + param + '=' + v);
         }
        }
</script>
<table>
    <tr>
        <th>
            受理编号
        </th>
        <th>
            标题
        </th>
        <th>
            办理人
        </th>
        <th>
            受理时间
        </th>
        <th>
            状态
        </th>
        		   <th>
				ID
		   </th>
	    		   <th>
				是否前台显示
		   </th>
	    		   <th>
				标题
		   </th>
	    		   <th>
				姓名
		   </th>
	    		   <th>
				年龄
		   </th>
	    		   <th>
				性别
		   </th>
	    		   <th>
				案例
		   </th>
	        </tr>
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
        <%if (Item.Public==1){ %>
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
    <%} 
	}
	%>
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
