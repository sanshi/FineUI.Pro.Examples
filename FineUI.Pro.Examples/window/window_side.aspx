<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_side.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_side" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <style>
            body {
                background: url('<%= PageContext.ResolveUrl("~/res/images/bg/small/3.jpg") %>') !important;
                overflow: hidden;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />

        <f:Window ID="Window1" Hidden="true" PositionX="Left" Width="200px" PercentHeight="100%" IsModal="true" HideOnMaskClick="true" runat="server"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false" EnableDefaultCorner="false">
            <Content>
                PositionX="Left" Width="200px" PercentHeight="100%" IsModal="true" HideOnMaskClick="true"
            </Content>
        </f:Window>

        <f:Window ID="Window2" Hidden="true" PositionX="Right" Width="200px" PercentHeight="100%" IsModal="true" HideOnMaskClick="true" runat="server"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false" EnableDefaultCorner="false">
            <Content>
                PositionX="Right" Width="200px" PercentHeight="100%" IsModal="true" HideOnMaskClick="true"
            </Content>
        </f:Window>

        <f:Window ID="Window3" Hidden="true" PositionY="Top" Height="100px" PercentWidth="100%" IsModal="true" HideOnMaskClick="true" runat="server"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false" EnableDefaultCorner="false">
            <Content>
                PositionY="Top" Height="100px" PercentWidth="100%" IsModal="true" HideOnMaskClick="true"
            </Content>
        </f:Window>


        <f:Window ID="Window4" Hidden="true" PositionY="Bottom" Height="100px" PercentWidth="100%" IsModal="true" HideOnMaskClick="true" runat="server"
            AutoScroll="true" BodyPadding="10px" ShowHeader="false" EnableDefaultCorner="false">
            <Content>
                PositionY="Bottom" Height="100px" PercentWidth="100%" IsModal="true" HideOnMaskClick="true"
            </Content>
        </f:Window>

        <f:Window ID="Window5" Width="300px" Layout="VBox" BoxConfigSpace="5" PositionX="Center" PositionY="Center" runat="server" AutoScroll="true"
            BodyPadding="10px" ShowHeader="false" IsModal="false">
            <Items>
                <f:Button runat="server" ID="Button1" Text="左侧窗体" ClickHandler="onOpenWindow1Click"></f:Button>
                <f:Button runat="server" ID="Button2" Text="右侧窗体" ClickHandler="onOpenWindow2Click"></f:Button>
                <f:Button runat="server" ID="Button3" Text="顶部窗体" ClickHandler="onOpenWindow3Click"></f:Button>
                <f:Button runat="server" ID="Button4" Text="底部窗体" ClickHandler="onOpenWindow4Click"></f:Button>
            </Items>
        </f:Window>

    </form>
    <script>
        var window1ClientID = '<%= Window1.ClientID %>';
        var window2ClientID = '<%= Window2.ClientID %>';
        var window3ClientID = '<%= Window3.ClientID %>';
        var window4ClientID = '<%= Window4.ClientID %>';

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onOpenWindow2Click(event) {
            F(window2ClientID).show();
        }

        function onOpenWindow3Click(event) {
            F(window3ClientID).show();
        }

        function onOpenWindow4Click(event) {
            F(window4ClientID).show();
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>从页面四个方向显示带遮罩的侧边窗体，点击遮罩即可关闭。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>切换四个方向</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="左侧窗体">左侧窗体</strong>，再点击窗体外的遮罩。<br />结果：对应方向的窗体显示，遮罩后方暂时不能操作；点击遮罩后窗体隐藏。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="右侧窗体">右侧窗体</strong>，再点击窗体外的遮罩。<br />结果：对应方向的窗体显示，遮罩后方暂时不能操作；点击遮罩后窗体隐藏。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="顶部窗体">顶部窗体</strong>，再点击窗体外的遮罩。<br />结果：对应方向的窗体显示，遮罩后方暂时不能操作；点击遮罩后窗体隐藏。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>' title="底部窗体">底部窗体</strong>，再点击窗体外的遮罩。<br />结果：对应方向的窗体显示，遮罩后方暂时不能操作；点击遮罩后窗体隐藏。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>PositionX</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="第 2 个窗口">第 2 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window5").ClientID %>' title="第 5 个窗口">第 5 个窗口</strong>）：初始为 <code>Left</code>、<code>Right</code>、<code>Center</code>，指定窗体在水平方向的对齐位置。</li>
        <li><code>PositionY</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window3").ClientID %>' title="第 3 个窗口">第 3 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window4").ClientID %>' title="第 4 个窗口">第 4 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window5").ClientID %>' title="第 5 个窗口">第 5 个窗口</strong>）：初始为 <code>Top</code>、<code>Bottom</code>、<code>Center</code>，指定窗体在垂直方向的对齐位置。</li>
        <li><code>PercentWidth</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window3").ClientID %>' title="第 3 个窗口">第 3 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window4").ClientID %>' title="第 4 个窗口">第 4 个窗口</strong>）：初始为 <code>100%</code>，按可用视口宽度的百分比计算窗体宽度。</li>
        <li><code>PercentHeight</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="第 2 个窗口">第 2 个窗口</strong>）：初始为 <code>100%</code>，按可用视口高度的百分比计算窗体高度。</li>
        <li><code>HideOnMaskClick</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="第 2 个窗口">第 2 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window3").ClientID %>' title="第 3 个窗口">第 3 个窗口</strong>）：初始为 <code>true</code>，点击窗体遮罩时隐藏窗体。</li>
        <li><code>IsModal</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="第 2 个窗口">第 2 个窗口</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window3").ClientID %>' title="第 3 个窗口">第 3 个窗口</strong>）：初始为 <code>true</code>、<code>false</code>，显示窗体遮罩，限制对遮罩后方内容的操作。</li>
    </ul>
</section>
</template>
</body>
</html>
