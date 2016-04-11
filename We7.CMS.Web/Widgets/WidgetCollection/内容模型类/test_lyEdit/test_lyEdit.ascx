﻿<!--### name="留言录入(自动布局)" type="system" version="1.0" created="2012/2/16 20:20:04" desc="留言板" author="We7 Group" ###-->
<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.AdviceEditorProviderEx" %>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "留言信息编辑部件", Author = "系统生成")]
    string MetaData;
</script>
    <form id="form1" runat="server">
        <asp:MultiView ID="mvAdvice" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewContent" runat="server">
                <table id="advice">
                    <tr id="trAdviceType" runat="server">
                        <td>提交到</td>
                        <td>
                            <asp:HiddenField ID="hdModelName" runat="server" Value="test.ly" />
                            <asp:HiddenField ID="hdAdvice" runat="server" />
                            <asp:DropDownList ID="drpAdvice" runat="server" DataTextField="Title" DataValueField="ID" onchange="javascript:getVal(this);">

                            </asp:DropDownList>                            
                        </td>
                    </tr>
                    					                    					                    <tr>
                    <td class="lable">
                        年龄
                    </td>
                    <td class="content">
                        <asp:PlaceHolder ID="_age" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                                    					                    <tr>
                    <td class="lable">
                        性别
                    </td>
                    <td class="content">
                        <asp:PlaceHolder ID="_sex" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                                    					                    <tr>
                    <td class="lable">
                        案例
                    </td>
                    <td class="content">
                        <asp:PlaceHolder ID="_Demo" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                                                      
                    <tr>
                        <td class="lable">
                            验证码：
                        </td>
                        <td class="content">
                            <asp:TextBox ID="txtValidate" runat="server" CssClass="required" Width="50"></asp:TextBox>
                            <img
                        id="img1" src="/Install/VerifyCode.aspx?" alt="看不清？点击更换" onclick="this.src=this.src+'?'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="lable">
                        </td>
                        <td>
                            <asp:Button ID="bttnSave" runat="server" CommandName="add" Text="保存" OnClick="OnValidateSubmit"
                                CssClass="button_style" />
                            <input type="reset" value="重置" />
                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="viewMessage" runat="server">-->
				【查询编号】：<asp:Label ID="lblSN" runat="server"></asp:Label><br />
				【密码】：<asp:Label ID="lblPwd" runat="server"></asp:Label><br />
				【新密码】：<asp:TextBox ID="txtPwd" runat="server"></asp:TextBox><br />
				<asp:Button runat="server" Text="修改" ID="bttnUpdate" /><asp:Label ID="lblMsg2" runat="server"></asp:Label><br/>
                反馈提交成功，我们会把处理信息发送到你的邮箱里。谢谢。               
            </asp:View>
        </asp:MultiView>
    </form>
<script type="text/javascript">
//<![CDATA[

function getVal(e){
    var id = e.id;
    var val = document.getElementById(id).options[document.getElementById(id).options.selectedIndex].value;
    document.getElementById("<%=hdAdvice.ClientID %>").value = val;
}
</script>