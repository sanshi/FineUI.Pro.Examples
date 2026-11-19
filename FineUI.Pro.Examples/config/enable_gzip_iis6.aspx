<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="enable_gzip_iis6.aspx.cs" Inherits="FineUI.Pro.Examples.config.enable_gzip_iis6" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        ol li {
            margin-bottom: 5px;
        }

        .title {
            font-size: 14px;
            font-weight: bold;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server"></f:PageManager>
        <div class="title">
            如何在IIS6中启用GZIP压缩
        </div>
        <div style="margin: 10px 0;">
            启用GZIP压缩可以减少网络传输的数据量，加快页面的显示速度。
        </div>
        <ol>
            <li>展开IIS管理器，在网站菜单上点击右键，点击属性菜单，选择服务选项卡，按下图选中启用压缩的复选框。
                <br />
                <img src="<%= PageContext.ResolveUrl("~/res/images/enable-gzip-iis6-1.png") %>" />
                <br />
                <img src="<%= PageContext.ResolveUrl("~/res/images/enable-gzip-iis6-2.png") %>" />
                <br />
            </li>
            <li>从<a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=56fc92ee-a71a-4c73-b628-ade629c89499&DisplayLang=en">这里</a>下载IIS
                6.0资源工具包，安装后运行Metabase Explorer。
                <br />
                <img src="<%= PageContext.ResolveUrl("~/res/images/enable-gzip-iis6-3.png") %>" />
                <br />
            </li>
            <li>展开 LM>W3SVC>Filters>Compression，你需要如下编辑 gzip 和 deflate 两个菜单。
                <br />
                HcScriptFileExtensions:asp,dll,aspx,axd,asmx,php,exe
                <br />
                HcDynamicCompressionLevel:10
                <br />
                HcFileExtensions:htm,html,js,css
                <br />
                <img src="<%= PageContext.ResolveUrl("~/res/images/enable-gzip-iis6-4.png") %>" />
                <br />
            </li>
            <li>重启IIS。
                <br />
                <img src="<%= PageContext.ResolveUrl("~/res/images/enable-gzip-iis6-5.png") %>" />
            </li>
        </ol>
        <div>
            原文链接：<a
                href="http://www.codeproject.com/Articles/31073/Enable-Gzip-compression-in-IIS-6-0-for-ASP-NET-2-0">http://www.codeproject.com/Articles/31073/Enable-Gzip-compression-in-IIS-6-0-for-ASP-NET-2-0</a>
        </div>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>展示历史 IIS6 环境启用 GZIP 的手工配置步骤，供对应环境核对。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>核对本机环境与步骤</h3>
            <ul>
                <li>依次查看<strong class="example-control-reference" data-example-control="form1"
                        title="页面表单">配置步骤</strong>，在自己的对应环境执行。<br />结果：本页只展示说明和截图，不会自动修改开发工具或服务器配置；版本不同应按实际环境核对。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>适用环境</code>（<strong class="example-control-reference" data-example-control="form1" title="页面表单">页面表单</strong>）：本页步骤专门针对 IIS6，不能当作其它
                    IIS 版本的通用配置。</li>
            </ul>
        </section>
    </template>
</body>
</html>
