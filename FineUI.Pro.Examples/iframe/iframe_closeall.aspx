<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iframe_closeall.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.iframe_closeall" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/iframe_iframe_window1.aspx;~/iframe/iframe_iframe_window2.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <br />
        <f:Button ID="Button1" Text="在本页面弹出窗体" runat="server" ClickHandler="onOpenWindow1Click">
        </f:Button>
        <f:Window ID="Window1" Hidden="true" EnableIFrame="true" runat="server"
            EnableMaximize="true" EnableResize="true" Height="500px" Width="900px" Title="窗体一">
        </f:Window>
        <br />
        <br />
        <f:Button ID="Button2" Text="在父页面弹出窗体" runat="server" ClickHandler="onOpenWindow2Click">
        </f:Button>
        <f:Window ID="Window2" Hidden="true" EnableIFrame="true" EnableMaximize="true"
            EnableResize="true" Target="Parent" runat="server" Height="500px" Width="900px"
            Title="窗体二">
        </f:Window>
        <br />
        <br />
        <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
        </f:Label>
        <br />
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';
        var Window2ClientID = '<%= Window2.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/iframe_closeall_window1.aspx") %>');
        }

        function onOpenWindow2Click(event) {
            F(Window2ClientID).show('<%= ResolveUrl("~/iframe/iframe_closeall_window1.aspx") %>');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示从最内层子窗体关闭整组嵌套窗体，并通知最外层页面。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>逐层打开并关闭窗体</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="在本页面弹出窗体">在本页面弹出窗体</strong>。<br />结果：先打开包含子页面的第一层窗体。</li>
        <li>在子页面继续打开内层 <code>iframe</code> 窗体。<br />结果：第二层窗体在本页指定的承载位置显示，原有外层页面继续保留。</li>
        <li>在最内层点击<strong>全部关闭</strong>。<br />结果：对应窗体按本页调用顺序关闭，最外层结果标签显示关闭信息或时间。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Target</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体二">窗体二</strong>）：设为<code>Parent</code>，分别控制每一层窗体的显示位置。</li>
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体一">窗体一</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体二">窗体二</strong>）：设为<code>true</code>，各层使用独立子页面。</li>
        <li><code>F.getActiveWindow()</code>（<strong>嵌套子页面</strong>）：从子页面取得对应活动窗体，避免关闭错误的父层。</li>
    </ul>
</section>
</template>
</body>
</html>
