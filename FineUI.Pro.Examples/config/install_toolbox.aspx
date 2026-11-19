<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="install_toolbox.aspx.cs" Inherits="FineUI.Pro.Examples.config.install_toolbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        ol li {
            margin-bottom: 5px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server"></f:PageManager>
        <div>
            安装工具箱
        </div>
        <ol>
            <li>打开 Visual Studio，新建一个 Web 项目； </li>
            <li>打开 Default.aspx 页面；</li>
            <li>打开工具箱，在空白处点击右键选择“添加选项卡”，输入“FineUI”； </li>
            <li>在“FineUI”选项卡内，单击右键选择“选择项...”； </li>
            <li>在弹出的窗口的下面，选择“浏览...”按钮；</li>
            <li>打开“FineUI.Pro.dll”并确定。 </li>
        </ol>
        <div>
            安装完成后的截图：
            <br />
            <img alt="FineUI toolbox" src="<%= PageContext.ResolveUrl("~/res/images/toolbox.png") %>" />
        </div>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>展示 Visual Studio 中安装 FineUI.Pro 工具箱项的手工步骤。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>核对本机环境与步骤</h3>
            <ul>
                <li>依次查看<strong class="example-control-reference" data-example-control="form1"
                        title="页面表单">配置步骤</strong>，在自己的对应环境执行。<br />结果：本页只展示说明和截图，不会自动修改开发工具或服务器配置；版本不同应按实际环境核对。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>适用环境</code>（<strong class="example-control-reference" data-example-control="form1" title="页面表单">页面表单</strong>）：选择与项目引用一致的 FineUI.Pro
                    程序集作为工具箱来源。</li>
            </ul>
        </section>
    </template>
</body>
</html>
