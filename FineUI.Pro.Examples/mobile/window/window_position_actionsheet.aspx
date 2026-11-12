<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position_actionsheet.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_position_actionsheet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <style>
            .mybgpanel>.f-panel-bodyct>.f-panel-body {
                background-color: #FEF3D5;
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/bg/small/3.jpg") %>');
                background-position: right bottom;
                background-repeat: no-repeat;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" CssClass="mybgpanel" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigSpace="5" BodyPadding="10px" runat="server">
            <Items>
                <f:Button runat="server" ID="btnOpenWindow" Text="动作面板" ClickHandler="onOpenWindow1Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" ShowHeader="false" Hidden="true" HideOnMaskClick="true" IsModal="true" BodyPadding="10px" Layout="VBox"
            BoxConfigSpace="5" PercentWidth="100%" EnableDefaultCorner="false" PositionY="Bottom">
            <Items>
                <f:Button runat="server" ID="Button1" Size="Large" Text="相册" ClickHandler="onOpenAlbumClick"></f:Button>
                <f:Button runat="server" ID="Button2" Size="Large" Text="拍照" MarginBottom="15px" ClickHandler="onTakeAPictureClick"></f:Button>
                <f:Button runat="server" ID="Button3" Text="取消" ClickHandler="onCloseWindow1Click"></f:Button>
            </Items>
        </f:Window>
    </form>

    <script>
        var window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onCloseWindow1Click(event) {
            F(window1ClientID).hide();
        }


        function onOpenAlbumClick(event) {
            F(window1ClientID).hide();
            showCenterNotify('你点击了 [相册] 按钮！');
        }

        function onTakeAPictureClick(event) {
            F(window1ClientID).hide();
            showCenterNotify('你点击了 [拍照] 按钮！');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示从底部显示动作面板，用独立按钮提供操作与取消入口。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>选择动作或取消</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOpenWindow").ClientID %>' title="动作面板">动作面板</strong>。<br />结果：面板贴底并使用当前视口宽度，背景出现遮罩。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="拍照">拍照</strong>。<br />结果：浏览器隐藏面板并显示本页动作提示；示例并未真的调用设备相机。</li>
        <li>再次打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOpenWindow").ClientID %>' title="动作面板">动作面板</strong>，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="取消">取消</strong>。<br />结果：只隐藏动作面板，不执行相册或拍照动作。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>PositionY</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗口">窗口</strong>）：窗体贴底显示。 本页使用<code>Bottom</code>。</li>
        <li><code>PercentWidth</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗口">窗口</strong>）：窗体占当前视口全部宽度。 本页使用<code>100%</code>。</li>
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗口">窗口</strong>）：用 <code>VBox</code> 顺序放置独立动作按钮与取消按钮。 本页使用<code>VBox</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
