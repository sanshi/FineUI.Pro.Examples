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
</body>
</html>
