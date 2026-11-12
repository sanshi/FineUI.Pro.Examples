<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_prefixtabs.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_prefixtabs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab Title="FineUI官网" EnableIFrame="true" IFrameUrl="https://fineui.com/" runat="server">
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <f:Button ID="btnOpenPages" Text="在新的选项卡中打开新页面" runat="server">
            <Menu runat="server">
                <f:MenuButton ID="Button1" runat="server" Text="打开DeepSeek官网（tab1_iframe）" OnClick="Button1_Click"></f:MenuButton>
                <f:MenuButton ID="Button2" runat="server" Text="打开ASP.NET官网（tab1_iframe）" OnClick="Button2_Click"></f:MenuButton>
                <f:MenuButton ID="Button3" runat="server" Text="打开FineUI官网（tab2_iframe）" OnClick="Button3_Click"></f:MenuButton>
            </Menu>
        </f:Button>
        <br />
    </form>

    <script>
        var tabstripClientID = '<%= TabStrip1.ClientID %>';
        var btnOpenPagesClientID = '<%= btnOpenPages.ClientID %>';

        F.ready(function () {
            var btnEl = F(btnOpenPagesClientID).el;
            var tabstripTitleEl = F(tabstripClientID).headerEl.find(' > .f-panel-title');

            var titleHeight = tabstripTitleEl.height();
            var btnWidth = btnEl.outerWidth(true);
            var btnHeight = btnEl.outerHeight(true);
            
            // 添加按钮样式（浮动，居中）
            btnEl.css({
                'position': 'absolute',
                'left': '5px',
                'top': ( titleHeight - btnHeight ) / 2
            });

            // TabStrip标题栏左侧留出空白放置按钮
            tabstripTitleEl.css({
                'margin-left': btnWidth + 10
            });


            // 添加按钮背景墙（出现左右滚动按钮时，防止选项卡标题覆盖此按钮）
            var btnContainer = $('<div>', {
                'class': 'f-widget-header'
            }).css({
                'position': 'absolute',
                'left': '0',
                'top': '0',
                'border-bottom-style': 'solid',
                'border-bottom-width': '1px',
                'z-index': 1,
                'width': btnWidth + 10,
                'height': titleHeight + 1
            }).insertBefore(tabstripTitleEl);

            // 将按钮添加到背景墙中
            btnEl.appendTo(btnContainer);

        });

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示把打开页面的菜单按钮放在标签标题之前，并在同一容器中新增标签。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>从标题栏前部打开新页</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOpenPages").ClientID %>' title="在新的选项卡中打开新页面">在新的选项卡中打开新页面</strong>。<br />结果：浏览器展开标题栏前部的菜单，已有标签标题仍排列在按钮之后。</li>
        <li>选择菜单中的<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="打开DeepSeek官网（tab1_iframe）">打开DeepSeek官网（tab1_iframe）</strong>。<br />结果：菜单项回发，后台按指定 <code>ID</code> 新建或更新 <code>iframe</code> 标签并激活它。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>PrefixTabs</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：把本页菜单按钮配置在标签标题列表之前。</li>
        <li><code>AddTab()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：在当前容器中打开菜单指定的页面。</li>
    </ul>
</section>
</template>
</body>
</html>
