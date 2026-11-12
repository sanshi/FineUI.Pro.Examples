<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.toolbar.toolbar_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" ID="Panel1" IsFluid="true" Title="面板" Height="500px"
            EnableIFrame="true" IFrameName="main" EnableCollapse="false">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Button runat="server" ID="Button1" Text="打开页面一"
                            ClickHandler="onOpenPage1Click">
                        </f:Button>
                        <f:Button runat="server" ID="Button2" Text="打开页面二"
                            ClickHandler="onOpenPage2Click">
                        </f:Button>
                        <f:Button runat="server" ID="Button3" Text="打开页面三（服务器端）" OnClick="Button3_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script>
        var panel1ClientID = '<%= Panel1.ClientID %>';

        function updateIFrameUrl(url) {
            F(panel1ClientID).setIFrameUrl(url);
        }

        // updateIFrameUrl 和 updateIFrameUrl2 效果一样
        function updateIFrameUrl2(url) {
            window.open(url, 'main');
        }

        function onOpenPage1Click(event) {
            updateIFrameUrl2('../basic/hello.aspx');
        }

        function onOpenPage2Click(event) {
            updateIFrameUrl2('../basic/hello_aspnet.aspx');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示工具栏按钮在同一 <code>iframe</code> 面板中切换页面，对比浏览器导航与后台更新地址。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>通过工具栏切换内联页面</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="打开页面一">打开页面一</strong>。<br />结果：浏览器把 <code>iframe</code> 导航到页面一，外层工具栏保持可见。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="打开页面二">打开页面二</strong>。<br />结果：复用同一个 <code>iframe</code> 显示页面二，不新增外层页面。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="打开页面三（服务器端）">打开页面三（服务器端）</strong>。<br />结果：按钮回发后由后台更新面板 <code>iframe</code> 地址。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：设为<code>true</code>，面板使用 <code>iframe</code> 显示工具栏选择的内容。</li>
        <li><code>IFrameName</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：设为<code>main</code>，供链接指定当前面板为导航目标。</li>
        <li><code>IFrameUrl</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：替换该面板中的导航地址。</li>
    </ul>
</section>
</template>
</body>
</html>
