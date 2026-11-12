<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_iframe.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.panel.panel_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" runat="server" ShowHeader="false" ShowBorder="false"
            EnableIFrame="true" IFrameUrl="~/mobile/button/button.aspx">
            <Toolbars>
                <f:Toolbar ID="Toolbar2" Title="面板（IFrame）" runat="server" HeaderStyle="true">
                </f:Toolbar>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" CssClass="f-state-default">
                    <Items>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button runat="server" Text="转到其他页面" Size="Small" EnableDefaultState="false" ShowMenuIcon="false">
                            <Menu runat="server">
                                <f:MenuButton Text="首页" AttributeDataTag="../button/button.aspx" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                                <f:MenuButton Text="按钮分组" AttributeDataTag="../button/buttongroup.aspx" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                                <f:MenuButton Text="按钮分组（垂直）" AttributeDataTag="../button/buttongroup_vertical.aspx" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                                <f:MenuButton Text="按钮分组（与选项卡交互）" AttributeDataTag="../button/buttongroup_tabstrip.aspx" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script>

        var panel1ClientID = '<%= Panel1.ClientID %>';

        function onMyMenuButtonClick(event) {
            var iframeUrl = this.getAttr('data-tag');
            F(panel1ClientID).setIFrameUrl(iframeUrl);
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示移动面板通过 <code>iframe</code> 显示网页，并从底部菜单切换同一个内联页面。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>切换内联页面</h3>
    <ul>
        <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>底部的菜单，选择另一个页面。<br />结果：浏览器更新同一面板的 <code>iframe</code> 地址，标题栏和底部操作区继续保留。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：面板内容由 <code>iframe</code> 页面提供。 本页使用<code>true</code>。</li>
        <li><code>IFrameUrl</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：指定当前加载的子页面地址。 本页使用<code>~/mobile/button/button.aspx</code>。</li>
        <li><code>setIFrameUrl()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：底部菜单切换地址，不替换外层移动面板。</li>
    </ul>
</section>
</template>
</body>
</html>
