<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/window_iframe.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <br />
        <f:Button ID="Button1" Text="弹出窗体" runat="server" ClickHandler="onOpenWindow1Click">
        </f:Button>
        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server" Target="Top"
            EnableMaximize="true" EnableResize="true" Height="500px" Width="800px" Title="窗体一">
        </f:Window>
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/window_iframe.aspx") %>');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在 <code>iframe</code> 窗体中加载独立表单页面，关闭窗体后保留外层页面。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>打开与关闭内联表单</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="弹出窗体">弹出窗体</strong>。<br />结果：本页窗体加载独立子页。</li>
        <li>在子页填写字段，再关闭当前窗体。<br />结果：子页输入属于独立 <code>iframe</code>，外层页面及其加载时间继续保留。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体一">窗体一</strong>）：窗体内容由独立子页面提供。 本页使用<code>true</code>。</li>
        <li><code>Target</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体一">窗体一</strong>）：指定窗体在哪一层页面显示。 本页使用<code>Top</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
