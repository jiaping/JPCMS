<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetDetail" %>
<div class="<%=CssClass %> <%=MarginCss %>">
    <div class="article_line">
    </div>
    <div class="article_content">
        <h1>
            <span><font style="font-weight: normal; font-style: normal;">
                <%=Item[0]%></font></span>
        </h1>
        <div class="article_info">
            来源：<%=Item["Source"] %>
            发布时间：
            <%=ToDateStr(Item["Updated"], "yyyy-MM-dd")%>
            点击数：
            <%=Item["Clicks"] %>
        </div>
        <!--网站内容开始-->
        <div id="fontzoom" class="article_content_list">
            <div id="articleContnet">                
									栏目ID:<%=Item["OwnerID"] %><br />
									服务对象:<%=Item["ServiceObject"] %><br />
									网上申报:<%=Item["OnlineDeclaration"] %><br />
									办理示例:<%=Item["ForExample"] %><br />
									受理项目:<%=Item["AcceptanceOroject"] %><br />
									实施机关:<%=Item["ExecutiveAuthority"] %><br />
									受理岗位:<%=Item["AcceptJob"] %><br />
									申请人:<%=Item["Applicant"] %><br />
									具备条件:<%=Item["conditions"] %><br />
									提交材料:<%=Item["SubmitMaterials"] %><br />
									办理依据:<%=Item["BasedProcess"] %><br />
									办结期限:<%=Item["Applications"] %><br />
									收费标准:<%=Item["ChargeStandard"] %><br />
									受理部门:<%=Item["Department"] %><br />
									表格下载:<%=Item["FormDownload"] %><br />
									结果反馈:<%=Item["ResultFeedback"] %><br />
									示范文本:<%=Item["ModelText"] %><br />
									场景式服务:<%=Item["cjsfw"] %><br />
									办理结果:<%=Item["Results"] %><br />
									是否有表格:<%=Item["sftable"] %><br />
				            </div>
            <br>
            <div class="page_css">
                <span class="pagecss" id="pe100_page_contentpage"></span>
            </div>
            <div class="clear">
            </div>
        </div>
        <!--网站内容结束-->
        <div class="artilcle_tool">
            【字体：<a class="top_UserLogin" href="javascript:fontZoomA();">小</a> <a class="top_UserLogin"
                href="javascript:fontZoomB();">大</a>】【<a href="javascript:window.external.AddFavorite(document.location.href,document.title)">收藏</a>】
            【<a href="javascript:window.print();">打印</a>】【<a href="javascript:window.close()">关闭</a>】<span
                id="content_AdminEdit"></span> <span id="content_signin"></span><span id="content_SigninAjaxStatus"
                    style="display: none;"></span>
        </div>
        <!--上一篇-->
        <div class="article_page">
            <ul>
                <li><span>上一篇：</span>
                    <%
                        if (PreviousItem != null)
                        {
                    %>
                    <a target="_self" href="<%=GetUrl(PreviousItem["ID"]) %>">
                        <%=ToStr(PreviousItem[0],20)%></a>
                    <%}
                        else
                        { %>
                    <span>没有了！</span>
                    <%}%>
                </li>
                <li class="next"><span>下一篇：</span>
                    <%
                        if (NextItem != null)
                        {
                    %>
                    <a target="_self" href="<%=GetUrl(NextItem["ID"]) %>">
                        <%=ToStr(NextItem[0], 20)%></a>
                    <%}
                        else
                        { %>
                    <span>没有了！</span>
                    <%}%>
                </li>
            </ul>
        </div>
        <!--下一篇-->
    </div>
</div>
<script type="text/javascript" language="javascript">
    //双击鼠标滚动屏幕的代码
    var currentpos, timer;
    function initialize() {
        timer = setInterval("scrollwindow ()", 30);
    }
    function sc() {
        clearInterval(timer);
    }
    function scrollwindow() {
        currentpos = document.body.scrollTop;
        window.scroll(0, ++currentpos);
        if (currentpos != document.body.scrollTop)
            sc();
    }
    document.onmousedown = sc
    document.ondblclick = initialize

    //更改字体大小
    var status0 = '';
    var curfontsize = 10;
    var curlineheight = 18;
    function fontZoomA() {
        if (curfontsize > 8) {
            document.getElementById('fontzoom').style.fontSize = (--curfontsize) + 'pt';
            document.getElementById('fontzoom').style.lineHeight = (--curlineheight) + 'pt';
        }
    }
    function fontZoomB() {
        if (curfontsize < 64) {
            document.getElementById('fontzoom').style.fontSize = (++curfontsize) + 'pt';
            document.getElementById('fontzoom').style.lineHeight = (++curlineheight) + 'pt';
        }
    }
</script>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "网上办事详细信息部件", Author = "系统生成")]
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
            return "OwnerID,ServiceObject,OnlineDeclaration,ForExample,AcceptanceOroject,ExecutiveAuthority,AcceptJob,Applicant,conditions,SubmitMaterials,BasedProcess,Applications,ChargeStandard,Department,FormDownload,ResultFeedback,ModelText,cjsfw,Results,sftable";
        }
    } 
</script>
